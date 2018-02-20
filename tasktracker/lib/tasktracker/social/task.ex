defmodule Tasktracker.Social.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Social.Task


  schema "tasks" do
    field :status, :boolean
    field :task_body, :string
    field :task_title, :string
    field :time_spent, :integer
    
    belongs_to :user, Tasktracker.Accounts.User
    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:task_title, :task_body, :status, :time_spent, :user_id])
    |> validate_required([:task_title, :task_body, :status, :time_spent, :user_id])
  end
end
