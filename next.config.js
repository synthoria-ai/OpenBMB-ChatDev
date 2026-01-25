/** @type {import('next').NextConfig} */
const nextConfig = {
  // Enable standalone output for optimized Docker deployments
  // This creates a minimal production build with all dependencies bundled
  output: 'standalone',

  // Disable ESLint during builds if it's causing issues
  // Remove this if you want ESLint to run during builds
  eslint: {
    ignoreDuringBuilds: true,
  },

  // Disable TypeScript errors from blocking builds in production
  // Remove this if you want strict type checking during builds
  typescript: {
    ignoreBuildErrors: false,
  },
}

module.exports = nextConfig
