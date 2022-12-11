//
//  ObjectId.metal
//  12-RenderPhases
//
//  Created by Dmitrii Shliugaev on 16/12/2022.
//

#include <metal_stdlib>
using namespace metal;

#import "Common.h"

// 1
struct FragmentOut {
  uint objectId [[color(0)]];
};

// 2
fragment FragmentOut fragment_objectId(
  constant Params &params [[buffer(ParamsBuffer)]])
{
  // 3
  FragmentOut out {
    .objectId = params.objectId
  };
  return out;
}
