// Example Vertex Shader
out vec2 vUV;
out float visible;

uniform float appear;

void main() 
{
	vec4 worldSpacePos = TDDeform(P);
	vUV = uv[0].xy;
	visible = step(appear, worldSpacePos.w);
	gl_Position = TDWorldToProj(worldSpacePos);
}
#ifndef TD_PICKING_ACTIVE
#else // TD_PICKING_ACTIVE
// This will automatically write out the nessessary values
// for this shader to work with picking.
// See the documentation if you want to write custom values for picking.
TDWritePickingValues();
#endif // TD_PICKING_ACTIVE

