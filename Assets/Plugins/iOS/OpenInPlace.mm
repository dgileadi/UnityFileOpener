#import "OpenInPlace.h"

@implementation OpenInPlace

+ (BOOL) OpenInPlace:(NSString *)url uti:(NSString *)uti name:(NSString *)name {
    NSURL *url = [NSURL URLWithString:url];

    UIDocumentInteractionController* dic = [UIDocumentInteractionController interactionControllerWithURL:url];
    if (uti != nil)
        dic.UTI = uti;
    if (name != nil)
        dic.name = name;
    return [dic presentOpenInMenuFromRect:CGRectZero inView:UnityGetGLView() animated:YES];
}

extern "C" {
    void UFO_OpenInPlace(const char* url, const char* uti, const char* name) {
        [OpenInPlace OpenInPlace:[DataConvertor charToNSString:url] uti:[DataConvertor charToNSString:uti] name:[DataConvertor charToNSString:name]];
    }
}

@end
