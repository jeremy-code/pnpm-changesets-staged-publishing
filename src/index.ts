function isNumber(value: unknown): value is number {
  const typeofValue = typeof value;

  return typeofValue === "number" && Number.isFinite(value);
}

export { isNumber };
