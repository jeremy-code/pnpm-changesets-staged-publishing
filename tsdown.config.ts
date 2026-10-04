import { defineConfig, type UserConfig } from "tsdown";

const tsdownConfig: UserConfig = defineConfig({
  entry: "src/index.ts",
  platform: "neutral",
  target: "esnext",
  treeshake: true,
  unbundle: true,
  exports: true,
});

export default tsdownConfig;
