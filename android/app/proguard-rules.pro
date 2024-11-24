# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

-keep class com.umeng.** {*;}

-keepclassmembers class * {
   public <init> (org.json.JSONObject);
}

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
-dontshrink
-dontoptimize
-dontpreverify

-dontwarn cn.jpush.**
-keep class cn.jpush.** {*;}
-dontwarn cn.jiguang.**
-keep class cn.jiguang.** {*;}

-dontwarn cn.com.chinatelecom.**
-keep class cn.com.chinatelecom.** {*;}
-dontwarn com.ct.**
-keep class com.ct.** {*;}
-dontwarn a.a.**
-keep class a.a.** {*;}
-dontwarn com.cmic.**
-keep class com.cmic.** {*;}
-dontwarn com.unicom.**
-keep class com.unicom.** {*;}
-dontwarn com.sdk.**
-keep class com.sdk.** {*;}

-dontwarn com.sdk.**
-keep class com.sdk.** {*;}


######################云刷脸混淆规则   faceverify-BEGIN#######################
####
#不混淆内部类
-keepattributes InnerClasses

#不混淆jni调用类
-keepclasseswithmembers class *{
    native <methods>;
}

###################### faceverify-BEGIN ###########################
-ignorewarnings
-keep public class com.tencent.ytcommon.**{*;}
-keep class com.tencent.turingfd.sdk.mfa.TNative$aa { public *; }
-keep class com.tencent.turingfd.sdk.mfa.TNative$aa$bb { public *;}
-keep class com.tencent.turingcam.** {*;}
-keep class com.tencent.turingfd.** {*;}

-keep public class com.tencent.youtu.ytagreflectlivecheck.jni.**{*;}
-keep public class com.tencent.youtu.ytagreflectlivecheck.YTAGReflectLiveCheckInterface{
    public <methods>;
}
-keep public class com.tencent.youtu.ytposedetect.jni.**{*;}
-keep public class com.tencent.youtu.ytposedetect.data.**{*;}
-keep public class com.tencent.youtu.liveness.YTFaceTracker{*;}
-keep public class com.tencent.youtu.liveness.YTFaceTracker$*{*;}

-keep public class com.tencent.cloud.huiyansdkface.facelight.net.*$*{
    *;
}
-keep public class com.tencent.cloud.huiyansdkface.facelight.net.**{
    *;
}
-keep public class com.tencent.cloud.huiyansdkface.facelight.config.cdn.WbUiTips{
    *;
}

#================数据上报混淆规则 start===========================
#实体类
-keep class com.tencent.cloud.huiyansdkface.analytics.EventSender{
    *;
}
-keep class com.tencent.cloud.huiyansdkface.analytics.EventSender$*{
    *;
}
-keep class com.tencent.cloud.huiyansdkface.analytics.WBSAEvent{
     *;
}
-keep class com.tencent.cloud.huiyansdkface.analytics.WBSAParam{
     *;
}
#================数据上报混淆规则 end===========================

#######################faceverify-END#############################

####################### normal混淆规则-BEGIN#############################
#不混淆内部类
-keepattributes InnerClasses
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes Exceptions

-keep public class com.tencent.cloud.huiyansdkface.normal.net.*$*{
    *;
}
-keep public class com.tencent.cloud.huiyansdkface.normal.net.*{
    *;
}
#bugly
-keep class com.tencent.bugly.idasc.**{
    *;
}
#wehttp混淆规则
-dontwarn com.tencent.cloud.huiyansdkface.okio.**
-keep class com.tencent.cloud.huiyansdkface.okio.**{
    *;
}
-dontwarn com.tencent.cloud.huiyansdkface.okhttp3.OkHttpClient$Builder

####################### normal混淆规则-END #############################


        
        


