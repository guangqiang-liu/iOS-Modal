//
//  WLIconFont.m
//  IconFont
//
//  Created by 刘光强 on 2018/2/26.
//  Copyright © 2018年 刘光强. All rights reserved.
//

#import "WLIconFont.h"
#import <CoreText/CoreText.h>

@implementation WLIconFont

static NSString *_fontName;

+ (void)registerFontWithURL:(NSURL *)url {
    NSAssert([[NSFileManager defaultManager] fileExistsAtPath:[url path]], @"Font file doesn't exist");
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
    CGFontRef newFont = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    CTFontManagerRegisterGraphicsFont(newFont, nil);
    CGFontRelease(newFont);
}

+ (UIFont *)fontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:[self fontName] size:size];
    if (!font) {
//        NSURL *fontFileUrl = [[NSBundle mainBundle] URLForResource:[self fontName] withExtension:@"ttf"];
        NSString *iconfontName = @"iconfont.ttf";
        NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
        // 获取当前bundle的名称，这里的bundleName徐需要写死为WLIconFont，不然找不到包含字体文件的WLIconFont.bundle
//        NSString *currentBundleName = currentBundle.infoDictionary[@"CFBundleName"];
        NSString *fontPath = [currentBundle pathForResource:iconfontName ofType:nil inDirectory:[NSString stringWithFormat:@"%@.bundle", @"WLIconFont"]];
        NSURL *fontFileUrl = [NSURL fileURLWithPath:fontPath];
        [self registerFontWithURL: fontFileUrl];
        font = [UIFont fontWithName:[self fontName] size:size];
        NSAssert(font, @"UIFont object should not be nil, check if the font file is added to the application bundle and you're using the correct font name.");
    }
    return font;
}

+ (nullable UIFont *)fontWithName:(NSString *)fontName size:(CGFloat)fontSize {
    UIFont *font = [UIFont fontWithName:fontName size:fontSize];
    if (!font) {
        NSString *iconfontName = @"iconfont.ttf";
        NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
        NSString *fontPath = [currentBundle pathForResource:iconfontName ofType:nil inDirectory:[NSString stringWithFormat:@"%@.bundle", @"WLIconFont"]];
        NSURL *fontFileUrl = [NSURL fileURLWithPath:fontPath];
        [self registerFontWithURL: fontFileUrl];
        font = [UIFont fontWithName:fontName size:fontSize];
        NSAssert(font, @"UIFont object should not be nil, check if the font file is added to the application bundle and you're using the correct font name.");
    }
    return font;
}

+ (NSString*)fontName {
    return _fontName;
}

+ (void)setFontName:(NSString *)fontName {
    _fontName = fontName;
}

@end
