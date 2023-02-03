// https://vite-ruby.netlify.app/guide/rails.html#rails-integration
// https://vite-ruby.netlify.app/guide/plugins.html
// https://github.com/stafyniaksacha/vite-plugin-fonts

import { defineConfig } from "vite";
import * as path from "path";
import RubyPlugin from "vite-plugin-ruby";
import GzipPlugin from "rollup-plugin-gzip";
import ViteFonts from "vite-plugin-fonts";
import ViteReact from "@vitejs/plugin-react";
import FullReload from "vite-plugin-full-reload";
import inject from "@rollup/plugin-inject";

export default defineConfig({
  manifest: true,
  plugins: [
    inject({
      $: "jquery",
      jQuery: "jquery",
    }),
    FullReload(["config/routes.rb", "app/views/**/*"], { delay: 200 }),
    GzipPlugin(),
    RubyPlugin(),
    ViteFonts({
      custom: {
        display: "swap",
        families: [
          {
            name: "opendyslexic",
            local: "opendyslexic",
            src: "~/fonts/OpenDyslexic3.woff2",
          },
          {
            name: "tiresias",
            local: "tiresias",
            src: "~/fonts/Tiresias.woff2", // Visually Impaired
          },
        ],
        injectTo: "head",
      },
      google: {
        display: "swap",

        families: [
          {
            name: "Andika",
            styles: "ital,wght@0,400;1,200",
          },
          {
            name: "Inter",
            styles: "ital,wght@0,400;1,200",
          },
          {
            name: "Open Sans",
            styles: "ital,wght@0,400;1,200",
          },
          {
            name: "Spectral",
            styles: "ital,wght@0,400;1,200",
          },
          {
            name: "Style Script",
          },
        ],
        injectTo: "head",
      },
    }),
    ViteReact(),
  ],
  resolve: {
    alias: [
      {
        find: "@/lib",
        replacement: path.resolve(__dirname, "./app/frontend/components/lib/"),
      },
      {
        find: "@/components",
        replacement: path.resolve(__dirname, "./app/frontend/components/"),
      },
      {
        find: "@/entrypoints",
        replacement: path.resolve(__dirname, "./app/frontend/entrypoints"),
      },
    ],
  },
});
