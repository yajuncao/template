//
//  LYUtils.m
//  itemplate
//
//  Created by 路云开发者 on 15/6/2.
//  Copyright (c) 2015年 路云开发者. All rights reserved.
//

#import "LYUtils.h"

@implementation LYUtils

+(BOOL)checkTelNumber:(NSString*)telNumber
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186,181
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[0125-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:telNumber] == YES)
        || ([regextestcm evaluateWithObject:telNumber] == YES)
        || ([regextestct evaluateWithObject:telNumber] == YES)
        || ([regextestcu evaluateWithObject:telNumber] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+(NSString*)getDocumentsPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

+ (BOOL)isNull:(id)str
{
    if(str == nil || str == NULL || [str isKindOfClass:[NSNull class]]){
        return YES;
    }else{
        if([str isKindOfClass:[NSString class]]){
            if([str  isEqualToString: @""] || [str isEqualToString: @"null"] || [str  isEqualToString: @"NULL"] || [str  isEqualToString: @"<null>"] || [str isEqualToString: @"<NULL>"]){
                return YES;
            }
        }
        return NO;
    }
}
+ (NSString*)jidToUid:(NSString*)jid
{
    NSString* uid = nil;
    NSRange range = [jid rangeOfString:@"@"];
    if(range.length){
        uid = [jid substringToIndex:range.location];
    }
    return uid;
}

+ (NSString*)formateTimeFromTimestap:(NSInteger)time formateStr:(NSString*)formateStr
{
    NSString* backTime = @"";
    NSDate* d = [NSDate dateWithTimeIntervalSince1970:time / 1000];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    if([LYUtils isNull:formateStr]){
        formateStr = @"YYYY年MM月dd日";
    }
    [formatter setDateFormat:formateStr];
    backTime = [formatter stringFromDate:d];
    return backTime;
}

+ (NSString*)formateTimeToShow:(NSString*)timeSta
{
    if(![self isNumText:timeSta]){
        DLog(@"warning %@ is not a timestamp str", timeSta);
        return timeSta;
    }
    NSString* formatedDateStr = @"";
    NSDate *oldDate = [NSDate dateWithTimeIntervalSince1970:[timeSta doubleValue]/1000];
    NSDate *nowDate = [NSDate date];
    NSTimeInterval secondsBetweenDates= [nowDate timeIntervalSinceDate:oldDate];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *compsN = [[NSDateComponents alloc] init];
    NSDateComponents *compsO = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit;
    compsN = [calendar components:unitFlags fromDate:nowDate];
    compsO = [calendar components:unitFlags fromDate:oldDate];
    long newDay = [compsN day];
    long oldDay = [compsO day];
    if(secondsBetweenDates < 60 * 60 * 24){
        [dateformatter setDateFormat:@"HH:mm"];
        //有可能日期不同，但相隔不到一天
        if(newDay > oldDay){
            formatedDateStr = [@"昨天 " stringByAppendingFormat:@"%@", [dateformatter stringFromDate:oldDate]];
        }else{
            formatedDateStr = [dateformatter stringFromDate:oldDate];
        }
    }else if(secondsBetweenDates >= 60 * 60 * 24 && secondsBetweenDates < 60 * 60 * 24 *2){
        [dateformatter setDateFormat:@"HH:mm"];
        if(newDay - oldDay > 1){
            formatedDateStr = [@"前天 " stringByAppendingFormat:@"%@", [dateformatter stringFromDate:oldDate]];
        }else{
            formatedDateStr = [@"昨天 " stringByAppendingFormat:@"%@", [dateformatter stringFromDate:oldDate]];
        }
    }else if(secondsBetweenDates >= 60 * 60 * 24 * 2 && secondsBetweenDates < 60 * 60 * 24 *3){
        if(newDay - oldDay > 2){
            [dateformatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
            formatedDateStr = [dateformatter stringFromDate:oldDate];
        }else{
            [dateformatter setDateFormat:@"HH:mm"];
            formatedDateStr = [@"前天 " stringByAppendingFormat:@"%@", [dateformatter stringFromDate:oldDate]];
        }
    }else{
        [dateformatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
        formatedDateStr = [dateformatter stringFromDate:oldDate];
    }
    return formatedDateStr;
}
+ (BOOL)compareMTime:(NSString*)time1 time2:(NSString*)time2
{
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    id numTmp = [f numberFromString:time1];
    if(!numTmp){
        return false;
    }
    NSNumber* time1N = numTmp;
    numTmp = [f numberFromString:time2];
    if(!numTmp){
        return false;
    }
    NSNumber* time2N = numTmp;
    if(labs([time1N longValue] - [time2N longValue]) < 60 * 1000){
        return true;
    }else{
        return false;
    }
}
+ (NSString*)getFileFullPath:(NSString*)path
{
    NSString* docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString* fullPath = [docPath stringByAppendingFormat:@"%@", path];
    return fullPath;
}
//根绝结果是不是nil判断是否parse成功
+ (NSString*)jsonObjToString:(NSMutableDictionary*)dic
{
    NSString* jsonStr;
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    if([jsonData length] > 0 && error == nil) {
        jsonStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonStr;
}
+ (NSString*)jsonArrToString:(NSMutableArray*)arr{
    NSString* jsonStr;
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arr options:NSJSONWritingPrettyPrinted error:&error];
    if([jsonData length] > 0 && error == nil) {
        jsonStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    return jsonStr;
}

+(NSMutableData *)stingToNSData:(NSString *)str
{
    NSMutableData* result;
    NSData * strData = [str dataUsingEncoding:NSUTF8StringEncoding];
    result = [NSMutableData dataWithData:strData];
    
    return result;
}

//根绝结果是不是nil判断是否parse成功
+ (id)stringToJsonObj:(NSString*)str
{
    NSError *error = nil;
    NSData *data = nil;
    
    id jsonObjTmp;
    
    @try {
        data = [str dataUsingEncoding:NSUTF8StringEncoding];
        jsonObjTmp = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    } @catch (NSException* exception) {
        DLog(@"parse json error:%@", exception);
    }
    DLog(@"%@", [jsonObjTmp class]);
    if ([jsonObjTmp isKindOfClass:[NSDictionary class]]) {
        return jsonObjTmp;
    }else if([jsonObjTmp isKindOfClass:[NSArray class]]){
        return jsonObjTmp;
    }else{
        DLog(@"jsonObjTmp is not a NSDictionary");
        return nil;
    }
}

//nil判断parse是否成功
+ (NSMutableData*)dicToMutData:(NSMutableDictionary*)dic
{
    NSMutableData* result;
    if ([NSJSONSerialization isValidJSONObject:dic]){
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error: &error];
        result = [NSMutableData dataWithData:jsonData];
    }
    return result;
}

+(void) dispatch_main_after:(NSTimeInterval)delay call:(void (^)())call NS_AVAILABLE(10_7, 5_0)
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        call();
    });
}

CGSize winSize = {0, 0};

//+(CGSize)getScreenSize
//{
//    if(winSize.width == 0){
//        CGSize tmp = [[UIScreen mainScreen] bounds].size;
//        winSize.width = tmp.width;
//        winSize.height = tmp.height - 20;//减去的20是状态条
//    }
//
//    return winSize;
//}

+ (NSString *)timeStampAsString
{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    // NSTimeInterval返回的是double类型，输出会显示为10位整数加小数点加一些其他值
    // 如果想转成int型，必须转成long long型才够大。
    DLog(@"timeStampAsString1:%f", time);
    long long dTime = [[NSNumber numberWithDouble:time * 1000] longLongValue] ;
    DLog(@"timeStampAsString2:%lld", dTime);
    NSString *curTime = [NSString stringWithFormat:@"%llu",dTime];
    return curTime;
}

+(NSString*)getUniqueTaskId
{
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStrRef= CFUUIDCreateString(NULL, uuidRef);
//    NSString* uuidStrRef= CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    NSString *retStr = [NSString stringWithString:(__bridge NSString *)uuidStrRef];
    CFRelease(uuidStrRef);
    return retStr;
}

+(bool)imageIsNull:(UIImage*)img
{
    bool flag = false;
    if(img == nil || img.size.width == 0 || img.size.height == 0){
        flag = true;
    }
    return flag;
}

+(NSString*)getStrFromObj:(id)obj
{
    NSString* str = @"";
    DLog(@"obj class:%@", [obj class]);
    if(obj != nil && ![obj isKindOfClass:[NSNull class]]){
        str = [str stringByAppendingFormat:@"%@", obj];
    }
    return str;
}

//判断是否为整形：

+ (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形：

+ (BOOL)isPureFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}
//判断字符串是否为空
+ (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

+ (void)resetLabelXY:(UILabel*)label x:(float)x y:(float)y
{
    CGRect lR = label.frame;
    lR.origin.x = x;
    lR.origin.y = y;
    label.frame = lR;
}

+ (void)showAlert:(NSString*)title content:(NSString*)content
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:content delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}



+ (NSString *)prettyDateWithReference:(NSDate *)reference {
    NSString *suffix = @"后";
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    
    
    NSTimeInterval different = [reference timeIntervalSinceNow];
    
//    NSString *currentDateStr =[formatter stringFromDate:reference];
//    DLog(@"print reference:%@",currentDateStr)
//    DLog(@"print different:%f",different)
    
    if (different < 0) {
        different = -different;
        suffix = @"之前";
    }
    
    // days = different / (24 * 60 * 60), take the floor value
    float dayDifferent = floor(different / 86400);
    
    int days   = (int)dayDifferent;
    int weeks  = (int)ceil(dayDifferent / 7);
    int months = (int)ceil(dayDifferent / 30);
    int years  = (int)ceil(dayDifferent / 365);
    
    //DLog(@"Days:%d   weeks:%d   months:%d    years:%d  dayDifferent:%f",days,weeks,months,years,dayDifferent )
    
    // It belongs to today
    if (dayDifferent <= 0) {
        // lower than 60 seconds
        if (different < 60) {
            return @"刚刚";
        }
        
        // lower than 120 seconds => one minute and lower than 60 seconds
        if (different < 120) {
            return [NSString stringWithFormat:@"1分钟%@", suffix];
        }
        
        // lower than 60 minutes
        if (different < 60 * 60) {
            return [NSString stringWithFormat:@"%d分钟%@", (int)floor(different / 60), suffix];
        }
        
        // lower than 60 * 2 minutes => one hour and lower than 60 minutes
        if (different < 7200) {
            return [NSString stringWithFormat:@"1小时%@", suffix];
        }
        
        // lower than one day
        if (different < 86400) {
            return [NSString stringWithFormat:@"%d小时%@", (int)floor(different / 3600), suffix];
        }
    }
    // lower than one week
    else if (days < 7) {
        return [NSString stringWithFormat:@"%d天%@%@", days, days == 1 ? @"" : @"s", suffix];
    }
    // lager than one week but lower than a month
    else if (weeks < 4) {
        return [NSString stringWithFormat:@"%d周%@%@", weeks, weeks == 1 ? @"" : @"s", suffix];
    }
    // lager than a month and lower than a year
    else if (months < 12) {
        return [NSString stringWithFormat:@"%d月%@%@", months, months == 1 ? @"" : @"s", suffix];
    }
    // lager than a year
    else {  
        return [NSString stringWithFormat:@"%d年%@%@", years, years == 1 ? @"" : @"s", suffix];
    }  
    
    return self.description;  
}


//获取当前的日期，格式：2015-8-9
+ (NSString *)getCurrentDate
{
    NSDate *date = [NSDate date];
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    return [formatter stringFromDate:date];
}
//获取几天之后的日期，格式：2015-8-12
+ (NSString*)getDateAfter:(int)days
{
    NSDate*nowDate = [NSDate date];
    NSTimeInterval oneDay = 24 * 60 * 60 * 1;  //1天的长度
    NSDate* theDate;
    theDate = [nowDate initWithTimeIntervalSinceNow: + oneDay * days];
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    return [formatter stringFromDate:theDate];
}

//获取当前的日期
+ (NSDate *)getCurrentRealDate
{
    return [NSDate date];;
}
//获取几天之后的日期
+ (NSDate*)getRealDateAfter:(int)days
{
    NSDate*nowDate = [NSDate date];
    NSTimeInterval oneDay = 24 * 60 * 60 * 1;  //1天的长度
    NSDate* theDate;
    theDate = [nowDate initWithTimeIntervalSinceNow: + oneDay * days];
    return theDate;
}

+ (NSString*)getStarFromDateStr:(NSString*)timeStr
{
    NSArray* time = [timeStr componentsSeparatedByString:@"-"];
    NSString* star = @"";
    switch ([[time objectAtIndex:1] intValue]) {
        case 1:
        {
            if ([[time objectAtIndex:2] intValue]>0&& [[time objectAtIndex:2] intValue]<=20) {
                star = @"魔蝎座";
            }else {
                star = @"水瓶座";
            }
        }
            break;
            
        case 2:
        {
            if ([[time objectAtIndex:2] intValue]>0&& [[time objectAtIndex:2] intValue]<20) {
                star = @"水瓶座";
            }else {
                star = @"双鱼座";
            }
        }
            
            break;
            
        case 3:
        {
            if ([[time objectAtIndex:2] intValue]>0&& [[time objectAtIndex:2] intValue]<21) {
                star = @"双鱼座";
            }else {
                star = @"白羊座";
            }
        }
            
            break;
        case 4:
        {
            if ([[time objectAtIndex:2] intValue]>0&& [[time objectAtIndex:2] intValue]<21) {
                star = @"白羊座";
            }else {
                star = @"金牛座";
            }
        }
            break;
            
        case 5:
        {
            if ([[time objectAtIndex:2] intValue]>0&& [[time objectAtIndex:2] intValue]<22) {
                star = @"金牛座";
            }else {
                star = @"双子座";
            }
        }
            break;
            
        case 6:
        {
            if ([[time objectAtIndex:2] intValue]>0&& [[time objectAtIndex:2] intValue]<22) {
                star = @"双子座";
            }else {
                star = @"巨蟹座";
            }
        }
            break;
        case 7:
        {
            if ([[time objectAtIndex:2] intValue]>0&& [[time objectAtIndex:2] intValue]<23) {
                star = @"巨蟹座";
            }else {
                star = @"狮子座";
            }
        }
            break;
            
        case 8:
        {
            if ([[time objectAtIndex:2] intValue]>0&& [[time objectAtIndex:2] intValue]<24) {
                star = @"狮子座";
            }else {
                star = @"处女座";
            }
        }
            break;
            
        case 9:
        {
            if ([[time objectAtIndex:2] intValue]>0&& [[time objectAtIndex:2] intValue]<24) {
                star = @"处女座";
            }else {
                star = @"天秤座";
            }
        }
            break;
        case 10:
        {
            if ([[time objectAtIndex:2] intValue]>0&& [[time objectAtIndex:2] intValue]<24) {
                star = @"天秤座";
            }else {
                star = @"天蝎座";
            }
        }
            break;
            
        case 11:
        {
            if ([[time objectAtIndex:2] intValue]>0&& [[time objectAtIndex:2] intValue]<23) {
                star = @"天蝎座";
            }else {
                star = @"射手座";
            }
        }
            break;
            
        case 12:
        {
            if ([[time objectAtIndex:2] intValue]>0&& [[time objectAtIndex:2] intValue]<22) {
                star = @"射手座";
            }else {
                star = @"摩羯座";
            }
        }
            break;
        default:
            break;
    }
    return star;
}

+ (BOOL)isNumText:(NSString *)str
{
    if([LYUtils isNull:str] || ![str isKindOfClass:[NSString class]]){
        return NO;
    }
    //判断是不是纯数字
    NSScanner* scan = [NSScanner scannerWithString:str];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

+ (id)getObjectFromDic:(NSMutableDictionary*)dic key:(NSString*)key
{
    id tmp = [dic objectForKey:key];
    if([LYUtils isNull:tmp]){
        return nil;
    }else{
        return tmp;
    }
}


@end
