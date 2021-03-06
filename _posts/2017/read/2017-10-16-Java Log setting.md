---
layout: post
title: Java Log Setting
category: tech
---

Log4j:

{% highlight xml %}
<!-- Log4j Only allow DEBUG level into debug.log file -->
<appender name="debugAppender" class="org.apache.log4j.FileAppender">
  <param name="File" value="~/log/debug.log" />
  <layout class="org.apache.log4j.PatternLayout">
    <param name="ConversionPattern" value="[Time:%d][Level:%p]%m%n" />
  </layout>
  <filter class="org.apache.log4j.varia.LevelMatchFilter">
    <param name="LevelToMatch" value="DEBUG" />
    <param name="AcceptOnMatch" value="true" />
  </filter>
  <filter class="org.apache.log4j.varia.DenyAllFilter" />
</appender>
{% endhighlight %}

logback:
{% highlight xml %}
<appender name="debugAppender"
  class="ch.qos.logback.core.rolling.RollingFileAppender">
  <file>~/log/debug.log</file>
  <!-- only allow Debug level -->
  <filter class="ch.qos.logback.classic.filter.LevelFilter">
    <level>DEBUG</level>
    <onMatch>ACCEPT</onMatch>
    <onMismatch>DENY</onMismatch>
  </filter>
  <!-- rolling log files -->
  <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
    <fileNamePattern>~/log/debug.log.%i</fileNamePattern>
    <minIndex>1</minIndex>
    <maxIndex>10</maxIndex>
  </rollingPolicy>
  <triggeringPolicy
    class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
    <maxFileSize>10MB</maxFileSize>
  </triggeringPolicy>
  <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
    <Pattern>
      %d{yyyy-MM-dd HH:mm:ss} - %-5level %logger{36} - %msg%n
    </Pattern>
  </encoder>
</appender>
{% endhighlight %}
