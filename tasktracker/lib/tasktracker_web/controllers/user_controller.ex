defmodule TasktrackerWeb.UserController do
  use TasktrackerWeb, :controller

  import Ecto.Query
  alias Tasktracker.Social
  alias Tasktracker.Social.Task
  alias Tasktracker.Repo
  alias TasktrackerWeb.Router
  alias TasktrackerWeb.SessionController
  alias Tasktracker.Accounts
  alias Tasktracker.Accounts.User
  alias TasktrackerWeb.TaskController

 
  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    changeset = Accounts.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    case Accounts.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    num_of_tasks = Repo.all(TasktrackerWeb.TaskController.my_tasks(user)) |> Enum.count
    IO.inspect(TasktrackerWeb.TaskController.my_tasks(user))
    {:ok, _user} =    Accounts.delete_user(user)
    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: user_path(conn, :index))
  
end
end
