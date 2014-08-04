//
// Created by Feiko Lai on 2/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AftershipLogUtil : NSObject

+ (void)log:(NSString *)message;

+ (void)log:(NSString *)message withTag:(NSString *)tag;

+ (void)setEnabled:(BOOL)value;
@end