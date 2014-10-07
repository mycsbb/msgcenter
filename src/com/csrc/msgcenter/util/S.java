package com.csrc.msgcenter.util;  
  
import java.lang.reflect.Field;  
import java.lang.reflect.Method;  
import java.text.DateFormat;  
import java.text.DecimalFormat;  
import java.text.SimpleDateFormat;  
import java.util.ArrayList;  
import java.util.Arrays;  
import java.util.Date;  
import java.util.List;  
  
public class S {  
  
    public static DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
    public static DateFormat sdfAli = new SimpleDateFormat("yyyy.MM.dd HH:mm");  
    public static DateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");  
    public static DateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");  
    public static DecimalFormat df1 = new DecimalFormat("0.0");  
    public static DecimalFormat df2 = new DecimalFormat("0.00");  
    public static DecimalFormat df3 = new DecimalFormat("0.000");  
    public static DecimalFormat df4 = new DecimalFormat("0.0000");  
    public static DecimalFormat df1x = new DecimalFormat("0.#");  
    public static DecimalFormat df2x = new DecimalFormat("0.##");  
    public static DecimalFormat df3x = new DecimalFormat("0.###");  
    public static DecimalFormat df4x = new DecimalFormat("0.####");  
    public static final int decode = 1;// 标志是否用 java.net.URLDecoder.decode 解码  
  
    public static String xstring(String x) {  
        return (null == x || x.trim().length() == 0) ? null : x.trim();  
    }  
  
    public static String xstring(String x, int decode) {  
        return xstring(x, "", decode);  
    }  
  
    public static String xstring(String x, String defalutValue) {  
        return xstring(x) == null ? defalutValue : xstring(x);  
    }  
  
    public static String xstring(String x, String defalutValue, int decode) {  
        try {  
            x = java.net.URLDecoder.decode(S.xstring(x, defalutValue), "UTF-8");  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return x;  
    }  
  
    public static int xint(String x) {  
        return (int) (xfloat(x));  
    }  
  
    public static int xint(String x, int defalutValue) {  
        return xstring(x, "").replaceAll("[^0-9-.]", "").trim().length() == 0 ? defalutValue : xint(x);  
    }  
  
    public static double xdouble(String x, double defalutValue) {  
        return Double.parseDouble(xstring(xstring(x, "").replaceAll("[^0-9-.]", ""), "0"));  
    }  
  
    public static double xdouble(String x) {  
        return xdouble(x, 0d);  
    }  
  
    public static long xlong(String x, long defalutValue) {  
        return xstring(x, "").replaceAll("[^0-9-.]", "").trim().length() == 0 ? defalutValue : ((long) xdouble(x));  
    }  
  
    public static long xlong(String x) {  
        return xlong(x, 0l);  
    }  
  
    public static float xfloat(String x) {  
  
        return Float.parseFloat(xstring(xstring(x, "").replaceAll("[^0-9-.]", ""), "0"));  
    }  
  
    public static float xfloat(String x, float defalutValue) {  
        return xstring(x, "").replaceAll("[^0-9-.]", "").trim().length() == 0f ? defalutValue : xfloat(x);  
    }  
  
    public static String clean(String x) {  
        return S.xstring(x, "").replaceAll("[^0-9a-zA-Z-]", "");  
    }  
  
    public static String inSql(String x) {  
        return S.xstring(x, "").replace("'", "''");  
    }  
  
    public static String inDoubleQuot(String x) {  
        return S.xstring(x, "").replace("\"", "\\\"").replace("\r", "\\r").replace("\n", "\\n");  
    }  
  
    public static String addDoubleQuot(String x) {  
        return "\"" + inDoubleQuot(x) + "\"";  
    }  
  
    public static String inSingleQuot(String x) {  
        return S.xstring(x, "").replace("'", "\\'").replace("\r", "\\r").replace("\n", "\\n");  
    }  
  
    public static String addSingleQuot(String x) {  
        return "'" + inSingleQuot(x) + "'";  
    }  
  
    public static String riqi(Date date) {  
        if (date == null) {  
            return "";  
        }  
        return sdf.format(date);  
    }  
  
    public static String riqi() {  
        return sdf.format(new Date());  
    }  
  
    public static String riqiAli(Date date) {  
        return sdfAli.format(date);  
    }  
  
    public static String riqi2(Date date) {  
        if (date == null) {  
            return "";  
        }  
        return sdf2.format(date);  
    }  
  
    public static String riqi2() {  
        return sdf2.format(new Date());  
    }  
  
    public static String riqi3(Date date) {  
        if (date == null) {  
            return "";  
        }  
        return sdf3.format(date);  
    }  
  
    public static String riqi3() {  
        return sdf3.format(new Date());  
    }  
  
    public static String riqi(java.sql.Date date) {  
        return sdf.format(new java.util.Date(date.getTime()));  
    }  
  
    public static boolean isEmpty(String x) {  
        return x == null || x.trim().equals("") || x.trim().equals("null");  
    }  
  
    public static String left(String x, int num) {  
        x = S.xstring(x, "");  
        return x.length() < num ? x : x.substring(0, num);  
    }  
  
    public static String right(String x, int num) {  
        x = S.xstring(x, "");  
        return x.length() <= num ? x : x.substring(x.length() - num);  
    }  
  
    public static String now() {  
        return sdf.format(System.currentTimeMillis());  
    }  
  
    @Deprecated  
    public static boolean isInList(String s, List<String> list) {  
        for (String c : list) {  
            if ((c == null && s == null) || (s != null && s.equals(c))) {  
                return true;  
            }  
        }  
        return false;  
    }  
  
    @Deprecated  
    public static boolean isInArray(String s, String[] arr) {  
        for (int i = 0; i < arr.length; i++) {  
            if ((arr[i] == null && s == null) || (s != null && s.equals(arr[i]))) {  
                return true;  
            }  
        }  
        return false;  
    }  
  
    /** 
     * 整数a是否在list中 
     * 
     * @param a 
     * @param list 
     * @return 
     */  
    public static boolean inList(int a, List<Integer> list) {  
        for (Integer i : list) {  
            if (a == i.intValue()) {  
                return true;  
            }  
        }  
        return false;  
    }  
  
    /** 
     * 整数a是否在数组中 
     * 
     * @param a 
     * @param list 
     * @return 
     */  
    public static boolean inArray(int a, int[] arr) {  
        for (int i = 0; i < arr.length; i++) {  
            if (a == arr[i]) {  
                return true;  
            }  
        }  
        return false;  
    }  
  
    public static boolean inArray(String s, String[] arr) {  
        for (int i = 0; i < arr.length; i++) {  
            if ((arr[i] == null && s == null) || (s != null && s.equals(arr[i]))) {  
                return true;  
            }  
        }  
        return false;  
    }  
  
    @Deprecated  
    public static <T> String toJSON(T o) {  
        return JSONUtil.toJSON(o, 100, false, null, 0);  
    }  
  
    /** 
     * 将前n个字母大写 
     * 
     * @param s 
     * @param count 
     * @return 
     */  
    public static String upper(String s, int n) {  
        if (s == null) {  
            return null;  
        } else if (s.length() <= n) {  
            return s.toUpperCase();  
        } else {  
            return s.substring(0, n).toUpperCase() + s.substring(n);  
        }  
    }  
  
    public static String javaUpper(String s) {  
        if (s == null) {  
            return null;  
        } else if (s.length() == 1) {  
            return s.toUpperCase();  
        } else {  
            if (s.substring(1, 2).replaceAll("[A-Z]", "").length() == 0) {  
                return s;  
            } else {  
                return s.substring(0, 1).toUpperCase() + s.substring(1);  
            }  
        }  
    }  
  
    /** 
     * 将一个对象中所有String类型decode 
     * 
     * @param <T> 
     * @param o 
     * @param encoding 
     */  
    public static <T> void decode(T o, String encoding) {  
        if (o != null) {  
            try {  
                Field[] fields = o.getClass().getDeclaredFields();  
                Method[] methods = o.getClass().getMethods();  
                String c = "";  
                String get = "";  
                String set = "";  
                int geti = -1;  
                int seti = -1;  
                for (Field f : fields) {  
                    c = f.getType().getName();  
                    if (String.class.getName().equals(c)) {  
                        geti = -1;  
                        seti = -1;  
                        for (int idx = 0; idx < methods.length; idx++) {  
                            set = S.markMethodString(f, "set");  
                            get = S.markMethodString(f, "get");  
  
                            if (methods[idx].getName().equals(set)) {  
                                seti = idx;  
                            } else if (methods[idx].getName().equals(get)) {  
                                geti = idx;  
                            }  
                            if (seti > -1 && geti > -1) {  
                                String value = methods[geti].invoke(o) == null ? null : ((String) methods[geti].invoke(o));  
                                if (value != null) {  
                                    value = java.net.URLDecoder.decode(value, encoding);  
                                    //value = new String(value.getBytes("iso-8859-1"), "utf-8");  
                                    methods[seti].invoke(o, value);  
                                }  
                                break;  
                            }  
                        }  
                    }  
                }  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
    }  
  
    public static String markMethodString(Field f, String type) {  
        String s = "";  
        if ("get".equals(type)) {  
            s = (f.getType().getName().equals(boolean.class.getName()) ? "is" : "get") + javaUpper(f.getName());  
        } else if ("set".equals(type)) {  
            s = "set" + javaUpper(f.getName());  
        }  
        return s;  
    }  
  
    /** 
     * 将一个字符串decode 
     * 
     * @param s 
     * @param encoding 
     * @return 
     */  
    public static String decode(String s, String encoding) {  
        try {  
            s = s == null ? null : java.net.URLDecoder.decode(s, encoding);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return s;  
    }  
  
    /** 
     * 某个类中是否含有某个set方法 
     * 
     * @param <T> 
     * @param o 
     * @param field 
     * @return 
     */  
    public static boolean hasMethod(Class c, String method, Class... parameterTypes) {  
        try {  
            c.getMethod(method, parameterTypes);  
            return true;  
        } catch (Exception e) {  
            //S.p("---S.hasMethod: " + e.toString());  
            return false;  
        }  
    }  
  
    /** 
     * 将A转化为B 
     * 
     * @param <A> 
     * @param <B> 
     * @param a 
     * @param b 
     */  
    public static <A, B> B convert(A a, B b) {  
        try {  
            List<Field> flist = S.getAllFieldsIncludeSuper(b.getClass());  
            String get = "";  
            String set = "";  
            Object o = null;  
            for (Field f : flist) {  
                get = S.markMethodString(f, "get");  
                set = S.markMethodString(f, "set");  
                if (S.hasMethod(a.getClass(), get) && S.hasMethod(b.getClass(), set, f.getType())) {  
                    o = a.getClass().getMethod(get).invoke(a);  
                    b.getClass().getMethod(set, f.getType()).invoke(b, o);  
                }  
            }  
        } catch (Exception e) {  
            S.p("---S.convert(Cast " + a.getClass().getName() + " to " + b.getClass().getName() + "): " + e.toString());  
        }  
        return b;  
    }  
  
    public static List<Field> getAllFields(Class c) {  
        List<Field> flist = new ArrayList<Field>();  
        flist.addAll(Arrays.asList(c.getDeclaredFields()));  
        return flist;  
    }  
  
    public static List<Field> getAllFieldsIncludeSuper(Class c) {  
        List<Field> flist = new ArrayList<Field>();  
        flist.addAll(Arrays.asList(c.getDeclaredFields()));  
        flist.addAll(S.getSuperClassFields(c));  
        return flist;  
    }  
  
    public static List<Field> getSuperClassFields(Class c) {  
        List<Field> rslist = new ArrayList<Field>();  
        c = c.getSuperclass();  
        if (c != null && c.getName() != null && !c.getName().equals(Object.class.getName())) {  
            if (c.getDeclaredFields().length > 0) {  
                rslist.addAll(Arrays.asList(c.getDeclaredFields()));  
            }  
            List<Field> flist = getSuperClassFields(c);  
            rslist.addAll(flist);  
        }  
        return rslist;  
    }  
  
    public static void p(String s) {  
        System.out.println(s);  
    }  
  
    public static void p() {  
        System.out.println("");  
    }  
  
    public static void main(String[] args) {  
    }  
}  