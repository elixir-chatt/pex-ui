defmodule PexUi.Scene.Home do
  use Scenic.Scene
  require Logger

  alias Scenic.Graph
  alias Scenic.ViewPort

  import Scenic.Primitives
  import Scenic.Components
  @text_size 24

  def init(_, opts) do
    # get the width and height of the viewport. This is to demonstrate creating
    # a transparent full-screen rectangle to catch user input
    {:ok, %ViewPort.Status{size: {width, height}}} = ViewPort.info(opts[:viewport])

    graph =
      Graph.build(font: :roboto_mono, font_size: 50)
      |>  text("Press Start when ready.", translate: {120, 120})
      |>  button("Start", id: :sample_btn_id, translate: {225, 400}, width: 250, height: 100, button_font_size: 70)

    {:ok, graph, push: graph}
  end

  def handle_input(event, _context, state) do
    Logger.info("Received event: #{inspect(event)}")
    {:noreply, state}
  end
end
