//
//  LYUtils.h
//  itemplate
//
//  Created by 路云开发者 on 15/6/2.
//  Copyright (c) 2015年 路云开发者. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYUtils : NSObject
//毫秒
+ (NSString*)formateTimeFromTimestap:(NSInteger)time formateStr:(NSString*)formateStr;
+ (BOOL)isNull:(id)str;
//xmpp的jid转uid
+ (NSString*)jidToUid:(NSString*)jid;
//设置像qq聊天那样的时间显示格式
+ (NSString*)formateTimeToShow:(NSString*)timeSta;
//比较两个时间的分钟数大小（传入ms字符串）
+ (BOOL)compareMTime:(NSString*)time1 time2:(NSString*)time2;
//以获取在document下的文件的全路径（传入相对于document的路径）
+ (NSString*)getFileFullPath:(NSString*)path;
//将Dictionary转换成string
+ (NSString*)jsonObjToString:(NSMutableDictionary*)dic;
//将Dictionary转换成string
+ (NSString*)jsonArrToString:(NSMutableArray*)arr;

+(NSMutableData *)stingToNSData:(NSString *)str;
//将json string转换成Dictionary
+ (id)stringToJsonObj:(NSString*)str;
//将dic转成data
+ (NSMutableData*)dicToMutData:(NSMutableDictionary*)dic;
//main中定时执行函数
+(void) dispatch_main_after:(NSTimeInterval)delay call:(void (^)())call NS_AVAILABLE(10_7, 5_0);
//获取屏幕大小
//+(CGsize)getScreenSize;
//获取数字时间
+ (NSString *)timeStampAsString;
//获取Documents的全路径
+(NSString*)getDocumentsPath;
//匹配手机号
+(BOOL)checkTelNumber:(NSString*)telNumber;
//获取系统纳秒＋100以内的随机数，可以用作本机中某时的唯一标志
+(NSString*)getUniqueTaskId;
//检查图片是否存在
+(bool)imageIsNull:(UIImage*)img;
//从服务器获取json中的字符串时，判空
+(NSString*)getStrFromObj:(id)obj;
//判断是否为整形：
+ (BOOL)isPureInt:(NSString*)string;
//判断是否为浮点形：
+ (BOOL)isPureFloat:(NSString*)string;
//判断字符串是否为空
+ (BOOL) isBlankString:(NSString *)string;
//重置uilabel的x y
+ (void)resetLabelXY:(UILabel*)label x:(float)x y:(float)y;
//弹出提示框
+ (void)showAlert:(NSString*)title content:(NSString*)content;

//比较传入时间和当前时间的大小（传入NSDate ）
+ (NSString *)prettyDateWithReference:(NSDate *)reference;
//获取当前的日期，格式：2015-8-9
+ (NSString *)getCurrentDate;
//获取几天之后的日期，格式：2015-8-12
+ (NSString*)getDateAfter:(int)days;

//获取当前的日期
+ (NSDate *)getCurrentRealDate;
//获取几天之后的日期
+ (NSDate*)getRealDateAfter:(int)days;
//2015-08-01根据时间字符串获取星座
+ (NSString*)getStarFromDateStr:(NSString*)timeStr;
//是否是纯数字
+ (BOOL)isNumText:(NSString *)str;
//用于获取dic时判空，返回非空对象，如果为空则返回nil
+ (id)getObjectFromDic:(NSMutableDictionary*)dic key:(NSString*)key;
@end
