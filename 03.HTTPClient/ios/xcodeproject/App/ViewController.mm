
/*
This file is part of OpenSceneGraph cross-platform examples:
  https://github.com/OGStudio/openscenegraph-cross-platform-examples

Copyright (C) 2018 Opensource Game Studio

This software is provided 'as-is', without any express or implied
warranty.  In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgment in the product documentation would be
   appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.
3. This notice may not be removed or altered from any source distribution.
*/

#import "ViewController.h"

#import "library.h"
#import "network-ios.h"

@interface ViewController ()

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) UIView *renderView;
@property (nonatomic, strong) IBOutlet UIView *parentView;

@end

@implementation ViewController

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    // NOTE This must be done exactly once!
    [self setupRenderView];
}

- (void)setupRenderView
{
    // Remove old display link.
    if (self.displayLink)
    {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
    // Create new display link.
    self.displayLink =
        [CADisplayLink
            displayLinkWithTarget:self
            selector:@selector(step)];
    [self.displayLink
        addToRunLoop:[NSRunLoop currentRunLoop]
        forMode:NSDefaultRunLoopMode];
    // Embed OpenSceneGraph render view.
    self.renderView =
        library::init(
            self.parentView.frame.size.width,
            self.parentView.frame.size.height,
            [UIScreen mainScreen].scale,
            self.parentView
        );
    [self.view sendSubviewToBack:self.renderView];


    // TODO Decide this http thing.
    performGetRequest(@"https://github.com");


}

- (void)step
{
    library::frame();
}

@end
