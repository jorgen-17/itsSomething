//
//  ViewController.mm
//  itsSomething
//
//  Created by Jorge Nonell on 4/29/18.
//  Copyright © 2018 Jorge Nonell. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/CAMetalLayer.h>
#include <MoltenVK/mvk_vulkan.h>
#import "renderer.h"

static NSView* sampleView;        // Global variable to pass NSView to LunarG sample code

/**
 * Called from sample.
 * Initialize sample from view, and resize view in accordance with the sample.
 */
void init_window(struct sample_info &info) {
    info.window = (__bridge void*) sampleView;
    sampleView.bounds = CGRectMake(0, 0, info.width, info.height);
}

/** Called from sample. Return path to resource folder. */
std::string get_base_data_dir() {
    return [NSBundle.mainBundle.resourcePath stringByAppendingString: @"/"].UTF8String;
}

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.wantsLayer = YES;        // Back the view with a layer created by the makeBackingLayer method.
    
    sampleView = self.view;            // Pass the view to the sample code
    renderer::run(0, NULL);            // Run the LunarG sample
}


/** Resize the window to fit the size of the content as set by the sample code. */
-(void) viewWillAppear {
    [super viewWillAppear];

    CGSize vSz = self.view.bounds.size;
    NSWindow *window = self.view.window;
    NSRect wFrm = [window contentRectForFrameRect: window.frame];
    NSRect newWFrm = [window frameRectForContentRect: NSMakeRect(wFrm.origin.x, wFrm.origin.y, vSz.width, vSz.height)];
    [window setFrame: newWFrm display: YES animate: window.isVisible];
    [window center];
}

@end

@implementation View

/** Indicates that the view wants to draw using the backing layer instead of using drawRect:.  */
-(BOOL) wantsUpdateLayer { return YES; }

/** Returns a Metal-compatible layer. */
+(Class) layerClass { return [CAMetalLayer class]; }

/** If the wantsLayer property is set to YES, this method will be invoked to return a layer instance. */
-(CALayer*) makeBackingLayer { return [self.class.layerClass layer]; }

@end
