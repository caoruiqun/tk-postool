package com.taikang.utils;

import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.temporal.Temporal;
import java.time.temporal.TemporalAdjusters;

/**
 * @description: 日期工具类
 * @author: itw_caorq
 * @create: 2020-05-12 18:35
 **/
public class DateUtil {

    private static final DateTimeFormatter YEAR_MONTH_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM");
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private static final DateTimeFormatter DATETIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    private static final DateTimeFormatter TIME_FORMATTER = DateTimeFormatter.ofPattern("HH:mm:ss");
    private static final DateTimeFormatter SHORT_YEAR_MONTH_FORMATTER = DateTimeFormatter.ofPattern("yyyyMM");
    private static final DateTimeFormatter SHORT_DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyyMMdd");
    private static final DateTimeFormatter SHORT_DATETIME_FORMATTER = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
    private static final DateTimeFormatter SHORT_TIME_FORMATTER = DateTimeFormatter.ofPattern("HHmmss");

    /**
     * 返回当前的日期
     */
    public static LocalDate getCurrentLocalDate() {
        return LocalDate.now();
    }

    /**
     * 返回当前时间
     */
    public static LocalTime getCurrentLocalTime() {
        return LocalTime.now();
    }

    /**
     * 返回当前日期时间
     */
    public static LocalDateTime getCurrentLocalDateTime() {
        return LocalDateTime.now();
    }

    /**
     * 获取当前时间戳
     */
    public static long getTimestamp() {
        // LocalDateTime.now().toInstant(ZoneOffset.of("+8")).toEpochMilli();
        // LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
        // Timestamp.valueOf(LocalDateTime.now()).getTime();
        // Instant.now().toEpochMilli();
        return Instant.now().toEpochMilli();
    }

    /**
     * yyyy
     */
    public static int getCurrentYear() {
        return LocalDate.now().getYear();
    }

    /**
     * yyyy-MM
     */
    public static String getCurrentMonth() {
        return LocalDate.now().format(YEAR_MONTH_FORMATTER);
    }

    /**
     * yyyy-MM-dd
     */
    public static String getCurrentDate() {
        return LocalDate.now().format(DATE_FORMATTER);
    }

    /**
     * HHmmss
     */
    public static String getCurrentTime() {
        return LocalTime.now().format(TIME_FORMATTER);
    }

    /**
     * yyyy-MM-dd HH:mm:ss
     */
    public static String getCurrentDateTime() {
        return LocalDateTime.now().format(DATETIME_FORMATTER);
    }

    /**
     * yyyyMM
     */
    public static String getCurrentShortYearMonth() {
        return LocalDate.now().format(SHORT_YEAR_MONTH_FORMATTER);
    }

    /**
     * yyyyMMdd
     */
    public static String getCurrentShortDate() {
        return LocalDate.now().format(SHORT_DATE_FORMATTER);
    }

    /**
     * HHmmss
     */
    public static String getCurrentShortTime() {
        return LocalTime.now().format(SHORT_TIME_FORMATTER);
    }

    /**
     * yyyyMMddHHmmss
     */
    public static String getCurrentShortDateTime() {
        return LocalDateTime.now().format(SHORT_DATETIME_FORMATTER);
    }

    public static String getCurrentDate(String pattern) {
        return LocalDate.now().format(DateTimeFormatter.ofPattern(pattern));
    }

    public static String getCurrentTime(String pattern) {
        return LocalTime.now().format(DateTimeFormatter.ofPattern(pattern));
    }

    public static String getCurrentDateTime(String pattern) {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern(pattern));
    }

    /**
     * 时间戳与日期类型互转
     */
    public static LocalDateTime timestampToLocalDateTime(long timestamp) {
        Instant instant = Instant.ofEpochMilli(timestamp);
        return LocalDateTime.ofInstant(instant, ZoneId.systemDefault());
    }

    public static long localDateTimeToTimestamp(LocalDateTime localDateTime) {
        return localDateTime.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
    }

    /**
     * 时间戳格式化字符串
     */
    public static String formatTimestamp(long timestamp) {
        Instant instant = Instant.ofEpochMilli(timestamp);
        LocalDateTime localDateTime = LocalDateTime.ofInstant(instant, ZoneId.systemDefault());
        return formatLocalDateTime(localDateTime);
    }

    public static String formatTimestamp(long timestamp, String pattern) {
        Instant instant = Instant.ofEpochMilli(timestamp);
        LocalDateTime localDateTime = LocalDateTime.ofInstant(instant, ZoneId.systemDefault());
        return formatLocalDateTime(localDateTime, pattern);
    }

    /**
     * 日期对象转字符串
     */
    public static String formatLocalDate(LocalDate date) {
        return date.format(DATE_FORMATTER);
    }

    public static String formatLocalTime(LocalTime time) {
        return time.format(TIME_FORMATTER);
    }

    public static String formatLocalDateTime(LocalDateTime dateTime) {
        return dateTime.format(DATETIME_FORMATTER);
    }

    public static String formatLocalDate(LocalDate date, String pattern) {
        return date.format(DateTimeFormatter.ofPattern(pattern));
    }

    public static String formatLocalTime(LocalTime time, String pattern) {
        return time.format(DateTimeFormatter.ofPattern(pattern));
    }

    public static String formatLocalDateTime(LocalDateTime datetime, String pattern) {
        return datetime.format(DateTimeFormatter.ofPattern(pattern));
    }

    /**
     * 字符串转日期对象
     */
    public static LocalDate parseLocalDate(String date) {
        return LocalDate.parse(date, DATE_FORMATTER);
    }

    public static LocalTime parseLocalTime(String time) {
        return LocalTime.parse(time, TIME_FORMATTER);
    }

    public static LocalDateTime parseLocalDateTime(String dateTime) {
        return LocalDateTime.parse(dateTime, DATETIME_FORMATTER);
    }

    public static LocalDate parseLocalDate(String date, String pattern) {
        return LocalDate.parse(date, DateTimeFormatter.ofPattern(pattern));
    }

    public static LocalTime parseLocalTime(String time, String pattern) {
        return LocalTime.parse(time, DateTimeFormatter.ofPattern(pattern));
    }

    public static LocalDateTime parseLocalDateTime(String dateTime, String pattern) {
        return LocalDateTime.parse(dateTime, DateTimeFormatter.ofPattern(pattern));
    }

    /**
     * 获取本周第一天
     */
    public static String getWeekFirstDay() {
        return LocalDate.now().minusWeeks(0).with(DayOfWeek.MONDAY).toString();
    }

    /**
     * 获取本周最后一天
     */
    public static String getWeekLastDay() {
        return LocalDate.now().minusWeeks(0).with(DayOfWeek.SUNDAY).toString();
    }

    /**
     * 获取本月第一天
     */
    public static String getMonthFirstDay() {
        return LocalDate.now().with(TemporalAdjusters.firstDayOfMonth()).toString();
    }

    /**
     * 获取本月最后一天
     */
    public static String getMonthLastDay() {
        return LocalDate.now().with(TemporalAdjusters.lastDayOfMonth()).toString();
    }

    /**
     * 获取指定月份月第一天
     *
     * @param date yyyy-MM-dd
     */
    public static String getMonthFirstDay(String date) {
        LocalDate localDate = parseLocalDate(date);
        return localDate.with(TemporalAdjusters.firstDayOfMonth()).toString();
    }

    /**
     * 获取指定周第一天
     *
     * @param date yyyy-MM-dd
     */
    public static String getWeekFirstDay(String date) {
        LocalDate localDate = parseLocalDate(date);
        return localDate.minusWeeks(0).with(DayOfWeek.MONDAY).toString();
    }

    /**
     * 获取指定周最后一天
     *
     * @param date yyyy-MM-dd
     */
    public static String getWeekLastDay(String date) {
        LocalDate localDate = parseLocalDate(date);
        return localDate.minusWeeks(0).with(DayOfWeek.SUNDAY).toString();
    }

    /**
     * 获取当前星期
     *
     * @return 1:星期一、2:星期二、3:星期三、4:星期四、5:星期五、6:星期六、7:星期日
     */
    public static int getCurrentWeek() {
        return LocalDate.now().getDayOfWeek().getValue();
    }

    public static int getCurrentWeek(String date) {
        return parseLocalDate(date).getDayOfWeek().getValue();
    }

    public static int getCurrentWeek(String date, String pattern) {
        return parseLocalDate(date, pattern).getDayOfWeek().getValue();
    }

    /**
     * 日期相隔天数
     *
     * @param startDateInclusive
     * @param endDateExclusive
     */
    public static long periodDays(LocalDate startDateInclusive, LocalDate endDateExclusive) {
        return endDateExclusive.toEpochDay() - startDateInclusive.toEpochDay();
    }

    /**
     * 日期相隔小时
     *
     * @param startInclusive
     * @param endExclusive
     */
    public static long durationHours(Temporal startInclusive, Temporal endExclusive) {
        return Duration.between(startInclusive, endExclusive).toHours();
    }

    /**
     * 日期相隔分钟
     *
     * @param startInclusive
     * @param endExclusive
     */
    public static long durationMinutes(Temporal startInclusive, Temporal endExclusive) {
        return Duration.between(startInclusive, endExclusive).toMinutes();
    }

    /**
     * 日期相隔毫秒数
     *
     * @param startInclusive
     * @param endExclusive
     */
    public static long durationMillis(Temporal startInclusive, Temporal endExclusive) {
        return Duration.between(startInclusive, endExclusive).toMillis();
    }

    /**
     * 是否当天
     *
     * @param date
     */
    public static boolean isToday(LocalDate date) {
        return LocalDate.now().equals(date);
    }

    /**
     * 获取此日期时间与默认时区<Asia/Shanghai>组合的时间毫秒数
     *
     * @param dateTime
     */
    public static Long toEpochMilli(LocalDateTime dateTime) {
        return dateTime.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
    }

    /**
     * 获取此日期时间与指定时区组合的时间毫秒数
     *
     * @param dateTime
     */
    public static Long toSelectEpochMilli(LocalDateTime dateTime, ZoneId zoneId) {
        return dateTime.atZone(zoneId).toInstant().toEpochMilli();
    }

}