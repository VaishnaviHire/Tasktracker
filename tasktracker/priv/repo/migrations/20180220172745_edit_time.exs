defmodule Tasktracker.Repo.Migrations.EditTime do
  use Ecto.Migration

  def change do
      alter table(:tasks) do
      remove :time_spent
      add :time_spent, :integer
end

  end
end
