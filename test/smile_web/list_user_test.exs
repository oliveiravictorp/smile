defmodule SmileWeb.ListUserTest do
  use SmileWeb.ConnCase

  @authorization "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJzbWlsZSIsImV4cCI6MTczNDkyMDUwMywiaWF0IjoxNzMyNTAxMzAzLCJpc3MiOiJzbWlsZSIsImp0aSI6ImM2NmJkNjhmLTM5ZWQtNGU3NC04OWExLWI0M2RkNzFmNDRmNiIsIm5iZiI6MTczMjUwMTMwMiwic3ViIjoiYXV0aG9yaXplZF9jbGllbnQiLCJ0eXAiOiJhY2Nlc3MifQ._12iN0TLYVo4vSE6xILbpKhY9l3Rm6Rb4BT5JECQBkHA1btuSPHdEnwcUzJdCLYAr001Fm3QuhwuU35n1AymgA"

  @query """
  {
    listUser {
      id
      name
      active
      cameras(filter: "Hat", order: "desc") {
        id
        name
        brand
        active
      }
    }
  }
  """

  test "query: listUser", %{conn: conn} do
    conn =
      conn
      |> put_req_header("accept", "application/json")
      |> put_req_header("authorization", @authorization)
      |> post("/api/graphql", %{
        "query" => @user_query
      })

    assert json_response(conn, 200) == %{
             "data" => %{"listUser" => []}
           }
  end
end
