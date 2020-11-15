defmodule GigaWeb.ErrorView do
  use GigaWeb, :view

  def render(template, _assigns) do
    case Sentry.get_last_event_id_and_source() do
      {event_id, :plug} when is_binary(event_id) ->
        # can do %{eventId: event_id, title: "My custom title"}
        opts =
          %{eventId: event_id}
          |> Jason.encode!()

        ~E"""
          <script src="https://browser.sentry-cdn.com/5.9.1/bundle.min.js" integrity="sha384-/x1aHz0nKRd6zVUazsV6CbQvjJvr6zQL2CHbQZf3yoLkezyEtZUpqUNnOLW9Nt3v" crossorigin="anonymous"></script>
          <script>
            Sentry.init({ dsn: '<%= Sentry.Config.dsn() %>' });
            Sentry.showReportDialog(<%= raw opts %>)
          </script>
        """

      _ ->
        "Internal Server Error"
    end

    Phoenix.Controller.status_message_from_template(template)
  end
end
