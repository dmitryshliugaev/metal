//
//  Shaders.metal
//  03-Pipeline
//
//  Created by Dmitrii Shliugaev on 07/10/2022.
//

#include <metal_stdlib>
using namespace metal;


// 1
struct VertexIn {
  float4 position [[attribute(0)]];
};

// 2
vertex float4 vertex_main(const VertexIn vertexIn [[stage_in]]) {
  return vertexIn.position;
}

fragment float4 fragment_main() {
  return float4(1, 0, 0, 1);
}
