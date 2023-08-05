defmodule BlogWeb.CategoryController do
  use BlogWeb, :controller

  alias Blog.Categories
  alias Blog.Categories.Category

  def index(conn, _params) do
    categories = Categories.list_categories()
    render(conn, :index, categories: categories)
  end

  def new(conn, _params) do
    changeset = Categories.change_category(%Category{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"category" => category_params}) do
    case Categories.create_category(category_params) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Category created successfully.")
        |> redirect(to: ~p"/admin/categories/#{category.name}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   category = Categories.get_category!(id)
  #   render(conn, :show, category: category)
  # end

  def show(conn, %{"name" => name}) do
    category = Categories.get_category_by_name!(name)
    render(conn, :show, category: category)
  end

  # def edit(conn, %{"id" => id}) do
  #   category = Categories.get_category!(id)
  #   changeset = Categories.change_category(category)
  #   render(conn, :edit, category: category, changeset: changeset)
  # end

  def edit(conn, %{"name" => name}) do
    category = Categories.get_category_by_name!(name)
    changeset = Categories.change_category(category)
    render(conn, :edit, category: category, changeset: changeset)
  end

  # def update(conn, %{"id" => id, "category" => category_params}) do
  #   category = Categories.get_category!(id)

  #   case Categories.update_category(category, category_params) do
  #     {:ok, category} ->
  #       conn
  #       |> put_flash(:info, "Category updated successfully.")
  #       |> redirect(to: ~p"/admin/categories/#{category.name}")

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, :edit, category: category, changeset: changeset)
  #   end
  # end

  def update(conn, %{"name" => name, "category" => category_params}) do
    category = Categories.get_category_by_name!(name)

    case Categories.update_category(category, category_params) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Category updated successfully.")
        |> redirect(to: ~p"/admin/categories/#{category.name}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, category: category, changeset: changeset)
    end
  end

  # def delete(conn, %{"id" => id}) do
  #   category = Categories.get_category!(id)
  #   {:ok, _category} = Categories.delete_category(category)

  #   conn
  #   |> put_flash(:info, "Category deleted successfully.")
  #   |> redirect(to: ~p"/admin/categories")
  # end

  def delete(conn, %{"name" => name}) do
    category = Categories.get_category_by_name!(name)
    {:ok, _category} = Categories.delete_category(category)

    conn
    |> put_flash(:info, "Category deleted successfully.")
    |> redirect(to: ~p"/admin/categories")
  end
end
