if Application.get_env(:interval, Float, true) do
  defimpl Interval.Point, for: Float do
    @doc """
      iex> compare(1.0, 1.0)
      :eq
      
      iex> compare(1.0, 2.0)
      :lt

      iex> compare(2.0, 1.0)
      :gt
    """
    def compare(a, a) when is_float(a), do: :eq
    def compare(a, b) when is_float(a) and is_float(b) and a > b, do: :gt
    def compare(a, b) when is_float(a) and is_float(b) and a < b, do: :lt

    @doc """
      iex> type(1.0)
      :continuous
    """
    def type(a) when is_float(a), do: :continuous
    def type(_), do: :invalid

    @doc """
      iex> 1.0 |> next()
      ** (RuntimeError) Float is continuous
    """
    def next(a) when is_float(a), do: raise("Float is continuous")

    @doc """
      iex> 3.0 |> previous()
      ** (RuntimeError) Float is continuous
    """
    def previous(a) when is_float(a), do: raise("Float is continuous")

    @doc """
      iex> Interval.Point.Float.min(1, 2)
      1
    """
    defdelegate min(a, b), to: Kernel

    @doc """
      iex> Interval.Point.Float.max(1, 2)
      2
    """
    defdelegate max(a, b), to: Kernel
  end
end
