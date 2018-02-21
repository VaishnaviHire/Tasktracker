defmodule Tasktracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    drop table(:tasks)
    create table(:tasks) do
    add :task_title, :string, null: false
    add :task_body, :text, null: false
    add :status, :boolean, null: false
    add :time_spent, :integer
    add :user_id, references(:users, on_delete: :delete_all), null: false
  end
end
end
