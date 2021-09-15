//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 c_weight;
uniform float pixelH;
uniform float pixelW;
uniform float l_front_distance;
uniform float l_back_distance;


void main()
{
	vec2 offsetx;
	offsetx.x = pixelW;
	vec2 offsety;
	offsety.y = pixelH;
	
	float alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
	
	// darkness is increased the greater the dark value is
	float dark = l_back_distance / 180.0;
	// percent of how close are to light
	float light = 1.0 - min(l_front_distance / 180.0, 1.0);
	float rim = 0.0;
	float base = 0.0;
	
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetx ).a );
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetx ).a );
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsety ).a );
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsety ).a );
	
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetx + offsety ).a );
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetx - offsety ).a );
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetx - offsety ).a );
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetx + offsety ).a );
	
	
	// the bigger, the greater
	base = alpha / 8.0; // % of how deep inside the sprite
	rim = 1.0 - base; // % of how close to the rim the pixel is
	
	if(alpha <= 7.0)
	{
		rim = 1.0;
	}
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	//back light illuminaiton
	gl_FragColor.r =  min( gl_FragColor.r * 1.3, (gl_FragColor.r + (gl_FragColor.r * rim)) / (1.0 / dark) ); 
	gl_FragColor.g = min( gl_FragColor.g * 1.3, (gl_FragColor.g + (gl_FragColor.g * rim)) / (1.0 / dark) );
	gl_FragColor.b = min( gl_FragColor.b * 1.3, (gl_FragColor.b + (gl_FragColor.b * rim)) / (1.0 / dark) );
	
	if(base >= 0.7)
	{
		gl_FragColor.r = gl_FragColor.r - (.001 * base * c_weight.r);
		gl_FragColor.g = gl_FragColor.g - (.001 * base * c_weight.g);
		gl_FragColor.b = gl_FragColor.b - (.001 * base * c_weight.b);
	}
	
	// front light illumination
	gl_FragColor.r = gl_FragColor.r + (light * .2);
	gl_FragColor.g = gl_FragColor.g + (light * .2);
	gl_FragColor.b = gl_FragColor.b + (light * .2);
	
	

}
