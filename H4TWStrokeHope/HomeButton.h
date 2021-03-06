//
//  HomeButton.h
//  H4TWStrokeHope
//
//  Created by Rachel on 3/25/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeButton : UIButton
@property UILabel *myTitleLabel;
/* Creates a square blue button with rounded corners. Adds the text to the top left corner. */
- (id)initWithText:(NSString *)text withFrame:(CGRect)frame;
/* Scales image and adds it to the bottom right. */
- (void)addImageBottomRight:(UIImage *)image;
- (void)addImageBottomLeft:(UIImage *)image;//MM
/* Scales image and adds it to the right of the button, vertically centered. */
- (void)addImageRightCenter:(UIImage *)image;
/* Scales image and adds it to the center of the button. */
- (void)addImageCentered:(UIImage *)image;
/* Scales image, makes it round and adds it to the center of the button. */
- (void)addRoundImageCentered:(UIImage *)image;
/* Scales image and adds it to the size of the button. */
- (void)addImageFullSize:(UIImage *)image;
/* Scales image and adds it to the top right of the button */
- (void)addImageTopRight:(UIImage *)image;
/* Scales image, makes it square and adds it to the center of the button. */
- (void)addSquaredImageCentered:(UIImage *)image withSize: (float) size;

/* Temp */
- (void)addCoordinationImage:(UIImage *)image;
@end
