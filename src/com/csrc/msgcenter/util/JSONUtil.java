package com.csrc.msgcenter.util;  
  
import java.lang.reflect.Array;  
import java.lang.reflect.Field;  
import java.lang.reflect.Method;  
import java.text.SimpleDateFormat;  
import java.util.ArrayList;  
import java.util.Collection;  
import java.util.Date;  
import java.util.HashMap;  
import java.util.List;  
import java.util.Map;  
  
/** 
 * 
 * @author Administrator 
 */  
public class JSONUtil {  
  
    /** 
     * 字段过滤模式 
     */  
    public static final int INCLUDE = 0;  
    public static final int REMOVE = 1;  
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
  
    /** 
     * 
     * @param <T> 
     * @param o 
     * @param maxLength 如果是String型，字符串的最大截取长度 
     * @param createSub 如果是集合，那么集合中的子对象是否也生成json字串 
     * @param Map<String, List<String&rt;&rt; filterMap :对指定的类进行字段的过滤 
     * @param pattern 字段过滤模式：0(NOT)-只考虑已经列出的字段，1(REMOVE)-去除已经列出的字段 
     * @return 
     */  
    public static <T> String toJSON(T o, int maxLength, boolean createSub, Map<String, String> filterMap, int pattern) {  
        if (o == null) {  
            return "null";  
        }  
        return toJSONx(o, o.getClass(), maxLength, createSub, filterMap, pattern, null);  
    }  
  
    public static <T> String toJSON(T o) {  
        return JSONUtil.toJSON(o, 0, false, null, 0);  
    }  
  
    public static <T> String toJSON(T o, int maxLength) {  
        return JSONUtil.toJSON(o, maxLength, false, null, 0);  
    }  
  
    /** 
     * 
     * @param <T> 
     * @param o 要转为json的对象 
     * @param clazz o的类型，关键时刻，用于强制转换o的类型T为V 
     * @param maxLength 
     * @param createSub 
     * @param filterMap 
     * @param pattern 
     * @param olist 存储已经处理过的对象，在list中的索引越高，层级越深 
     * @return 
     */  
    private static <T> String toJSONx(T o, Class clazz, int maxLength, boolean createSub, Map<String, String> filterMap, int pattern, List<Object> olist) {  
        String s = "";  
        String c = "";  
        try {  
            if (o != null) {  
                /** 
                 * 不知道是何种类型的，利用反射得到元素，但是防止循环引用，此处做一次检查， 
                 * 有个缺陷，如果元素对相同对象引用两次，则只会自动转为不考虑下级对象模式，防止死循环 
                 */  
                olist = olist == null ? (new ArrayList<Object>()) : olist;  
                for (Object vo : olist) {  
                    if (vo == o) {  
                        createSub = false;  
                        S.p("-----(toJSONx)已爬取过,再爬取一次, 但不再考虑下级");  
                        break;  
                    } else {  
                        olist.add(o);  
                    }  
                }  
  
                c = o.getClass().getName();  
  
                //检查各种类型情况  
                if (String.class.getName().equals(c)) {  
                    return S.addDoubleQuot(maxLength > 0 ? S.left(o + "", maxLength) : (o + ""));  
                } else if (o instanceof Number  
                        || Boolean.class.getName().equals(c)  
                        || boolean.class.getName().equals(c)) {  
                    return o + "";  
                } else if (o instanceof Date) {  
                    return S.addDoubleQuot(sdf.format((Date) o));  
                } else if (o instanceof Collection) {  
                    s += "[";  
                    int k = 0;  
                    for (Object oo : (Collection) o) {  
                        if (createSub) {  
                            if (k++ > 0) {  
                                s += ", ";  
                            }  
                            s += toJSONx(oo, oo.getClass(), maxLength, createSub, filterMap, pattern, olist);  
                        } else {  
                            s += getJsonString(oo, maxLength);  
                        }  
                    }  
                    s += "]";  
  
                } else if (Map.class.getName().equals(c) || HashMap.class.getName().equals(c)) {  
                    s += "{";  
                    int k = 0;  
                    Map map = (HashMap) o;  
                    for (Object oo : map.keySet()) {  
                        if (k++ > 0) {  
                            s += ", ";  
                        }  
                        s += "\"" + S.inDoubleQuot(oo + "") + "\":";  
                        if (map.get(oo) == null) {  
                            s += "null";  
                        } else {  
                            if (createSub) {  
                                s += toJSONx(map.get(oo), oo.getClass(), maxLength, createSub, filterMap, pattern, olist);  
                            } else {  
                                s += getJsonString(map.get(oo), maxLength);  
                            }  
                        }  
                    }  
                    s += "}";  
                } else if (o != null && o.getClass().isArray()) {  
                    s += "[";  
                    for (int k = 0; k < Array.getLength(o); k++) {  
                        if (createSub) {  
                            if (k > 0) {  
                                s += ", ";  
                            }  
                            s += toJSONx(Array.get(o, k), clazz, maxLength, createSub, filterMap, pattern, olist);  
                        } else {  
                            s += "getJsonString(Array.get(o, k), maxLength)";  
                        }  
                    }  
                    s += "]";  
                } else {  
                    String[] fieldNames = null;  
                    if (filterMap != null && filterMap.get(o.getClass().getName() + "") != null) {  
                        fieldNames = S.xstring(filterMap.get(o.getClass().getName() + ""), "").split(",");  
                        //S.p("----o.getClass():" + o.getClass().getName() + "=" + filterMap.get(o.getClass().getName() + ""));  
                    }  
                    List<Field> flist = S.getAllFieldsIncludeSuper(clazz);  
                    String get = "";  
                    Method method;  
                    Object oo = null;  
                    if (flist.isEmpty()) {  
                        s = "{}";  
                    } else {  
                        int k = 0;  
                        s += "{";  
                        for (Field f : flist) {  
                            c = f.getType().getName();  
                            //字段过滤  
                            if (fieldNames != null) {  
                                if (pattern == REMOVE && S.isInArray(f.getName(), fieldNames)) {//去除模式  
                                    continue;  
                                } else if (pattern == INCLUDE && !S.isInArray(f.getName(), fieldNames)) {//包含模式  
                                    continue;  
                                }  
                            }  
  
                            //看有没有get方法把值给取出来,无法取值的，跳过  
                            get = S.markMethodString(f, "get");  
                            if (S.hasMethod(o.getClass(), get)) {  
                                method = o.getClass().getMethod(get);  
                                oo = method.invoke(o);  
                            } else {  
                                continue;  
                            }  
  
                            if (k++ > 0) {  
                                s += ", ";  
                            }  
  
                            s += S.addDoubleQuot(f.getName()) + " : ";  
                            //如果抓取下级, 则递归抓取  
                            if (createSub) {  
                                s += toJSONx(oo, f.getType(), maxLength, createSub, filterMap, pattern, olist);  
                            } else {  
                                s += getJsonString(oo, maxLength);  
                            }  
                        }  
                        s += "}";  
                    }  
                }  
  
            } else {  
                s += null;  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return s;  
    }  
  
    public static String x(int c) {  
        String s = "";  
        while (c-- > 0) {  
            s += "\t";  
        }  
        return s;  
    }  
  
    /** 
     * 生成最大长度为maxLength的字符串，如果maxLength为0，则全部输出 
     * 
     * @param <T> 
     * @param o 
     * @param maxLength 
     * @return 
     */  
    public static <T> String getJsonString(T o, int maxLength) {  
        //检查各种类型情况  
        String s = "", c = "";  
        if (o == null) {  
            return "null";  
        } else if (o instanceof Number  
                || Boolean.class.getName().equals((c = o.getClass().getName()))  
                || boolean.class.getName().equals(c)) {  
            s = o + "";  
            s = maxLength > 0 ? S.left(s, maxLength) : s;  
        } else if (String.class.getName().equals(c)) {  
            s = o + "";  
            s = S.addDoubleQuot(maxLength > 0 ? S.left(s, maxLength) : s);  
        } else if (o instanceof Date) {  
            s = sdf.format((Date) o);  
            s = S.addDoubleQuot(maxLength > 0 ? S.left(s, maxLength) : s);  
        } else if (o instanceof Collection || (o != null && o.getClass().isArray())) {  
            s = "[]";  
        } else if (Map.class.getName().equals(c) || HashMap.class.getName().equals(c)) {  
            s = "{}";  
        } else {  
            s = S.addDoubleQuot("");  
        }  
        return s;  
    }  
  
    /** 
     * 一个class是否实现了某个接口 
     * 
     * @param c 
     * @param szInterface 
     * @return 
     */  
    public static boolean isInterface(Class c, String szInterface) {  
        Class[] face = c.getInterfaces();  
        for (int i = 0, j = face.length; i < j; i++) {  
            if (face[i].getName().equals(szInterface)) {  
                return true;  
            } else {  
                Class[] face1 = face[i].getInterfaces();  
                for (int x = 0; x < face1.length; x++) {  
                    if (face1[x].getName().equals(szInterface)) {  
                        return true;  
                    } else if (isInterface(face1[x], szInterface)) {  
                        return true;  
                    }  
                }  
            }  
        }  
        if (null != c.getSuperclass()) {  
            return isInterface(c.getSuperclass(), szInterface);  
        }  
        return false;  
    }  
  
    /** 
     * 得到一个类中所有可用的Field的字符串List 
     * 
     * @param <T> 
     * @param o 
     * @return 
     */  
    public static <T> List<String> getFieldNameList(T o) {  
        List<String> list = new ArrayList<String>();  
        try {  
            List<Field> flist = S.getAllFieldsIncludeSuper(((T) o).getClass());  
            for (Field field : flist) {  
                list.add(field.getName());  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return list;  
    }  
  
    /** 
     * 向现有的json格式字串添加一个名称为key值为value的 key-value 对 
     * 
     * @param jsonString 
     * @param key 
     * @param jsonValue , 已经是json格式, 不要再添加引号了 
     * @return 
     */  
    public static String push(String jsonString, String key, String jsonValue) {  
        if (S.isEmpty(jsonString)  
                || S.isEmpty(key)  
                || S.isEmpty(jsonValue)  
                || !jsonString.trim().endsWith("}")) {  
            return jsonString;  
        }  
        jsonString = jsonString.trim();  
        jsonString = jsonString.substring(0, jsonString.length() - 1)  
                + (jsonString.indexOf(":") > 0 ? ", " : "")  
                + S.addDoubleQuot(key) + ": "  
                + jsonValue  
                + "}";  
        return jsonString;  
    }  
  
    public static void main(String[] args) {  
        System.out.println(JSONUtil.toJSON(new Date()));  
    }  
}  