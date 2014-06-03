//
//  PGAvatarView.m
//  Avatar Example
//
//  Created by Paul Pilone on 5/30/14.
//  Copyright (c) 2014 Paul Pilone. All rights reserved.
//

#import "PGAvatarView.h"

@interface PGAvatarView ()
@end

@implementation PGAvatarView

/*
 
*/
- (id)init
{
    self = [super init];
    if (self) {
        [self baseInit];
    }
    
    return self;
}

/*
 
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    
    return self;
}

/*

*/
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self baseInit];
    }
    
    return self;
}

/*
 
*/
- (void)setImage:(UIImage *)image
{
    _image = image;
    [self setNeedsDisplay];
}

/*
 
*/
- (void)setFillColor:(UIColor *)fillColor
{
    _fillColor = fillColor;
    [self setNeedsDisplay];
}

/*
 
*/
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    [self setNeedsDisplay];
}

/*
 
*/
- (void)setPlaceholderFont:(UIFont *)placeholderFont
{
    _placeholderFont = placeholderFont;
    [self setNeedsDisplay];
}

/*
 
*/
- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor
{
    _placeholderTextColor = placeholderTextColor;
    [self setNeedsDisplay];
}

/*
 
*/
- (void)drawRect:(CGRect)rect
{
    // Save the current context.
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    // Draw the clip. Inset the oval by border width to avoid clipping the stroke.
    // FIXME: It'd be cleaner to actually draw the border inside of our
    // clipping rect as opposed to cheating the clipping rect in.
    UIBezierPath *circleClip = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.bounds, self.borderWidth / 2.f, self.borderWidth / 2.f)];
    circleClip.lineWidth = self.borderWidth;

    // Stroke the path with the border color.
    [self.borderColor setStroke];
    [circleClip stroke];
    
    // Add the clip.
    [circleClip addClip];
    
    if (self.image) {
        //Draw the image.
        [self.image drawInRect:self.bounds];
    } else {
        // Draw the background color.
        [self.fillColor setFill];
        UIRectFill(self.bounds);
        
        // Draw the placeholder text using default attributes.
        NSDictionary *placeholderAttrs = [self placeholderAttributes];
        CGSize placeholderSize = [self.placeholder sizeWithAttributes:placeholderAttrs];
        CGRect placeholderRect = CGRectMake(0.f, CGRectGetMidY(self.bounds) - placeholderSize.height / 2.f, self.bounds.size.width, placeholderSize.height);
        [self.placeholder drawWithRect:placeholderRect options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:placeholderAttrs context:nil];
    }
    
    // Restore the current context.
    CGContextRestoreGState(ctx);
}

#pragma mark -
#pragma mark Private

/*
 
*/
- (void)baseInit
{
    // Set reasonable defaults for the border.
    _borderColor = [UIColor blackColor];
    _borderWidth = 1.f;
    
    // Default fill color.
    _fillColor = [UIColor colorWithWhite:.80 alpha:1.f];
    
    // Default fonts and text colors.
    _placeholderFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    _placeholderTextColor = [UIColor blackColor];
}

/*
 
*/
- (NSDictionary *)placeholderAttributes
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;

    return @{ NSForegroundColorAttributeName : self.placeholderTextColor,
              NSFontAttributeName : self.placeholderFont,
              NSParagraphStyleAttributeName : paragraphStyle
            };
}

@end
