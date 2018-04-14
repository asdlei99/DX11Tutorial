Texture2D shaderTexture;
SamplerState SampleType;

cbuffer FadeBuffer
{
    float fadeAmount;
    float3 padding;
};

struct PixelInputType
{
    float4 pos : SV_POSITION;
    float2 tex : TEXCOORD0;
};

float4 FadePixelShader(PixelInputType input) : SV_TARGET
{
    float4 color;

    // Sample the texture pixel at this location.
    color = shaderTexture.Sample(SampleType, input.tex);

	// Reduce the color brightness to the current fade percentage.
    color = color * fadeAmount;

    return color;
}