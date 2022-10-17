//
//  Fragment.metal
//  07-Fragment-function
//
//  Created by Dmitrii Shliugaev on 17/10/2022.
//

#include <metal_stdlib>
using namespace metal;
#import "Common.h"

struct VertexOut {
  float4 position [[position]];
};

fragment float4 fragment_main(VertexOut in [[stage_in]])
{
  return float4(0.2, 0.5, 1.0, 1);
}
