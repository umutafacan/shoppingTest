//
//  STSingleton.h
//  shoppingTest
//
//  Created by umut on 27/02/15.
//  Copyright (c) 2015 SmartClick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> 

@interface STSingleton : NSObject


+(id)sharedInstance;


@property (nonatomic,retain) NSDictionary *urlDict;
@property (nonatomic) BOOL isAppOpened;
@property (nonatomic) BOOL isPushTriggered;


-(void)setUrlDict:(NSDictionary *)dict;
-(NSString *)getElementFromUrlDictWithKey:(NSString *)key;

-(void)setIsAppOpened:(BOOL)status;
-(void)setIsPushTriggered:(BOOL)status;
-(BOOL)getIsAppOpened;
-(BOOL)getIsPushTriggered;
@end
