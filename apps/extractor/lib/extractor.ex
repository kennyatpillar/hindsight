defmodule Extractor do
  @spec execute(Enum.t()) :: {:ok, Extract.Context.t()} | {:error, term}
  def execute(steps) do
    Ok.reduce(steps, Extract.Context.new(), &Extract.Step.execute/2)
  rescue
    e -> {:error, error_message(e)}
  end

  defp error_message(e) do
    case Exception.exception?(e) do
      true -> Exception.message(e)
      false -> e
    end
  end
end
