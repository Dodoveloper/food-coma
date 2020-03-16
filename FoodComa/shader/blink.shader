shader_type canvas_item;

uniform bool enable = false;
uniform vec3 color = vec3(1.0, 1.0, 1.0);

void fragment() {
	vec4 C;
	
	//Read pixel from the texture this shader is attached to
	C = texture(TEXTURE, UV);
	//Apply color override
	if (enable) {
		C.rgb = color;
	}
	//Done
	COLOR = C;
}