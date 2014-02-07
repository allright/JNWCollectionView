//
//  JNWCollectionViewLinearLayoutSection.h
//  JNWCollectionView
//
//  Created by Andrey Syvrachev on 06.02.14.
//  Copyright (c) 2014 AppJon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
	CGPoint origin;
} JNWCollectionViewLinearLayoutItemInfo;

@interface JNWCollectionViewLinearLayoutSection : NSObject
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, assign) CGFloat offset;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) NSInteger numberOfItems;
@property (nonatomic, assign) JNWCollectionViewLinearLayoutItemInfo *itemInfo;

- (instancetype)initWithNumberOfItems:(NSInteger)numberOfItems;

@end
