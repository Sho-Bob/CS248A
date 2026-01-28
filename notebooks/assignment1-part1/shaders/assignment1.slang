import math;
import model;
import primitive;

/**
 * Fill a solid red color.
 * @param tid The 2D coordinate of the current thread. Ranges from (0, 0) to (canvasSize.x - 1, canvasSize.y - 1).
 * @return The color red as a float4 vector.
 */
public float4 fillRed(uint2 tid)
{
    // Return the color as a float4 vector (red, green, blue, alpha).
    // In this example, we set alpha to 1 to indicate a fully opaque pixel.
    // We'll cover alpha, transparency later in the class.
    // the color is a float4 vector (red, green, blue, alpha)
    return float4(1.0, 0.0, 0.0, 1.0);
}

/**
 * Fill a uv gradient pattern.
 * @param tid The 2D coordinate of the current thread. Ranges from (0, 0) to (canvasSize.x - 1, canvasSize.y - 1).
 * @param canvasSize The size of the output image in pixels.
 * @return The color corresponding to the uv(xy) coordinate of the pixel.
 */
public float4 fillGradient(uint2 tid, uint2 canvasSize)
{
    // TODO: Student implementation starts here.
    // the color is a float4 vector (red, green, blue, alpha)
    // the uv coordinate is a float2 vector (u, v)
    // tid is the 2D coordinate of the current thread. Ranges from (0, 0) to (canvasSize.x, canvasSize.y).
    // tid is not normalized, so let's normalize it to the range of (0, 1)
    float2 normalizedTid = float2(tid) / float2(canvasSize);

    // (u,v) = (0.0, 0.0) at the bottom-left corner: RGB_A(1.0, 0.0, 0.0, 1.0)
    // (u,v) = (1.0, 1.0) at the top-right corner: RGB_A(0.0, 1.0, 0.0, 1.0)
    // (u,v) = (normalizedTid.x, normalizedTid.y)
    // liner interpolation!
    return float4(normalizedTid.x, normalizedTid.y, 0.0, 1.0);

    // TODO: Student implementation ends here.
}

/**
 * Fill a checkerboard pattern.
 * @param tid The 2D coordinate of the current thread. Ranges from (0, 0) to (canvasSize.x - 1, canvasSize.y - 1).
 * @param canvasSize The size of the output image in pixels.
 * @param numSquares The number of squares along each axis.
 * @return The color white or black depending on the checkerboard pattern.
 */
public float4 fillCheckerboard(uint2 tid, uint2 canvasSize, uint numSquares)
{
        // First, let's define the checkerboard pattern
        float increment = 1.0 / numSquares;
        float2 normalizedTid = float2(tid) / float2(canvasSize);
        int index_u = int(normalizedTid.x / increment);
        int index_v = int(normalizedTid.y / increment);

        // Depending on the index_u and index_v, we can determine the color of the pixel.
        if((index_u + index_v) % 2 == 0)
        {
            return float4(1.0, 1.0, 1.0, 1.0);
        }
        else
        {
            return float4(0.0, 0.0, 0.0, 1.0);
        }
}

/**
 * Rasterize a single triangle.
 * @param tid The 2D coordinate of the current thread. Ranges from (0, 0) to (canvasSize.x - 1, canvasSize.y - 1).
 * @param canvasSize The size of the output image in pixels.
 * @param v0 The first vertex of the triangle in normalized coordinates.
 * @param v1 The second vertex of the triangle in normalized coordinates.
 * @param v2 The third vertex of the triangle in normalized coordinates.
 * @return The color white if the pixel is inside the triangle, otherwise black.
 */
public float4 triangleRasterizer(uint2 tid, uint2 canvasSize, float2 v0, float2 v1, float2 v2)
{
    // TODO: Student implementation starts here.

    return float4(1.0, 0.0, 1.0, 1.0);

    // TODO: Student implementation ends here.
}

/**
 * Test ray-triangle intersection for a single triangle.
 * @param tid The 2D coordinate of the current thread. Ranges from (0, 0) to (canvasSize.x - 1, canvasSize.y - 1).
 * @param canvasSize The size of the output image in pixels.
 * @param triangles A buffer containing triangles to test against. Only the first triangle is used in this function.
 * @return The color of the triangle if hit, otherwise black.
 */
public float4 rayTriangleTest(uint2 tid, uint2 canvasSize, StructuredBuffer<Triangle> triangles)
{
    // Get the first triangle in the buffer.
    Triangle triangle = triangles[0];
    // We generate rays with origin from (0, 0, 0) to (1, 1, 0) and direction towards the negative z axis (0, 0, -1).
    float2 uv = float2(tid) / float2(canvasSize);
    Ray ray = Ray(float3(uv, 0.0), float3(0.0, 0.0, -1.0), float2(0.0, float.maxValue));
    // How can we make sure the rays are set up correctly? Just return the value as color.
    // return float4(ray.origin.xy, 0.0, 1.0);
    Optional<RayHitResult> hitResult = triangle.hit(ray);
    if (hitResult.hasValue)
    {
        return float4(triangle.averageColor(), 1.0);
    }
    else
    {
        return float4(0.0, 0.0, 0.0, 1.0);
    }
}

/**
 * Test ray-triangle intersection for multiple triangles.
 * @param tid The 2D coordinate of the current thread. Ranges from (0, 0) to (canvasSize.x - 1, canvasSize.y - 1).
 * @param canvasSize The size of the output image in pixels.
 * @param triangles A buffer containing triangles to test against.
 * @param triangleCount The number of triangles in the buffer.
 * @return The color of the closest triangle if hit, otherwise black.
 */
public float4 rayTrianglesTest(uint2 tid, uint2 canvasSize, StructuredBuffer<Triangle> triangles, uint triangleCount)
{
    // We generate rays with origin from (0, 0, 0) to (1, 1, 0) and direction towards the negative z axis (0, 0, -1).
    float2 uv = float2(tid) / float2(canvasSize);
    Ray ray = Ray(float3(uv, 0.0), float3(0.0, 0.0, -1.0), float2(0.0, float.maxValue));

    // TODO: Student implementation starts here.

    return float4(1.0, 0.0, 1.0, 1.0);

    // TODO: Student implementation starts here.
}
