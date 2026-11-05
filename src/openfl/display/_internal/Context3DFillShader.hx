package openfl.display._internal;

import openfl.display.Shader;

/**
 * Dedicated shader for solid-color fills (`beginFill` / `drawRect`, and the camera
 * fill effects — background, flash, fade).
 *
 * The general `GraphicsShader` renders fills by sampling a 1x1 opaque-black texture
 * and applying the fill color through the color-transform machinery, which costs a
 * texture binding + fetch, the `openfl_HasColorTransform` uniform and several
 * attribute submissions per draw. This shader carries the fill color through the
 * color-offset attribute alone and never samples a texture.
 *
 * The math is equivalent to `GraphicsShader`'s `openfl_HasColorTransform == true`
 * path with that blank texture: the sampled texel is opaque black, so the rgb
 * multipliers are multiplied by zero, and the vertex stage forces the alpha
 * multiplier to 1.0 — leaving `color = clamp(offset)` for rgb and
 * `clamp(1.0 + offset.a)` for alpha, premultiplied by `openfl_Alphav`.
 */
class Context3DFillShader extends Shader
{
	@:glVertexHeader("attribute float openfl_Alpha;
		attribute vec4 openfl_ColorOffset;
		attribute vec4 openfl_Position;
		varying float openfl_Alphav;
		varying vec4 openfl_ColorOffsetv;

		uniform mat4 openfl_Matrix;")

	@:glVertexBody("openfl_Alphav = openfl_Alpha;
	openfl_ColorOffsetv = openfl_ColorOffset / 255.0;

	gl_Position = openfl_Matrix * openfl_Position;")

	@:glVertexSource("#pragma header
	void main(void) {
		#pragma body
	}")

	@:glFragmentHeader("varying float openfl_Alphav;
		varying vec4 openfl_ColorOffsetv;")

	@:glFragmentBody("vec4 color = vec4(clamp(openfl_ColorOffsetv.rgb, 0.0, 1.0), clamp(1.0 + openfl_ColorOffsetv.a, 0.0, 1.0));
	color.a *= openfl_Alphav;
	color.rgb *= color.a;

	gl_FragColor = color;")

	@:glFragmentSource("#pragma header
	void main(void) {
		#pragma body
	}")
	public function new()
	{
		super();
	}
}
