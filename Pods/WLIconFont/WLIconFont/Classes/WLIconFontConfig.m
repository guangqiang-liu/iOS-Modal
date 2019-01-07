//
//  WLIconFontConfig.m
//  IconFont
//
//  Created by 刘光强 on 2018/2/26.
//  Copyright © 2018年 刘光强. All rights reserved.
//

#import "WLIconFontConfig.h"

@implementation WLIconFontConfig

+ (NSDictionary *)glyphMap {
    return @{
             @"praise_selected_s": @"\U0000e60c",
             @"praise_unselected_o": @"\U0000e600",
             @"share_o": @"\U0000e70d",
             @"filter_o": @"\U0000e789",
             @"comment_o": @"\U0000e626",
             @"add_o": @"\U0000e6c9",
             };
}

+ (NSString *)fontName {
    return @"iconfont";
}

@end
