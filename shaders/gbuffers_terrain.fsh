uniform int worldTime;

uniform sampler2D lightmap;
uniform sampler2D texture;

float sindata;
varying vec2 lmcoord;
varying vec2 texcoord;
varying vec4 glcolor;

void main() {
	sindata = abs(sin(worldTime*0.05));
	vec4 diffuse = texture2D(texture, texcoord) * glcolor;
	diffuse *= texture2D(lightmap, lmcoord);
	diffuse.rgb *= vec3(sindata, sindata, sindata);
	gl_FragData[0] = diffuse;
}