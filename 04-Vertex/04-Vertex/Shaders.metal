//
//  Shaders.metal
//  04-Vertex
//
//  Created by Dmitrii Shliugaev on 10/10/2022.
//

#include <metal_stdlib>
using namespace metal;


vertex float4 vertex_main(
  constant packed_float3 *vertices [[buffer(0)]],
  uint vertexID [[vertex_id]])
{
  float4 position = float4(vertices[vertexID], 1);
  return position;
}

fragment float4 fragment_main() {
  return float4(0, 0, 1, 1);
}

