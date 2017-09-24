
attribute vec3 a_Position;
attribute vec3 a_TexCoordVec4;
attribute vec4 a_Color;

uniform mat4 g_ModelViewProjectionMatrix;
uniform vec3 g_ViewUp;
uniform vec3 g_ViewRight;
uniform float g_Time;

varying vec2 v_TexCoord;
varying vec4 v_Color;
varying float v_Blur;

uniform lowp vec3 g_Color1; // {"material":"color1","default":"1 1 1"}
uniform lowp vec3 g_Color2; // {"material":"color2","default":"1 1 1"}

void main() {
	vec3 position = vec3(a_Position.xy, 0.0) +
		(a_TexCoordVec4.z * g_ViewRight * (a_TexCoordVec4.x-0.5) +
		a_TexCoordVec4.z * -g_ViewUp * (a_TexCoordVec4.y-0.5)) * 0.5;
		
	gl_Position = mul(vec4(position, 1.0), g_ModelViewProjectionMatrix);
	
	v_TexCoord = a_TexCoordVec4.xy;
	v_Color = a_Color;
	v_Color.a *= 0.5;
	
	v_Color.rgb  = mix(g_Color1, g_Color2, v_Color.r);
	
	//vec4 sines = sin(vec4(0.1, 0.333, 7.8, 4.0) * g_Time * 0.4) * 0.5 + 0.5;
	//v_Color.rgb *= 0.1 + 2 * dot(sines, CAST4(0.1));
	
	v_Blur = smoothstep(-1, 1, a_Position.z);
}
