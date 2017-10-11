  private[api] def checkCols(df: DataFrame, cols: String*): Unit = {
    if (!df.columns.exists(cols.contains)) {
      throw new SparkException(s"Method can not be applied")
    }
  }