describe('add to cart', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("Navigate from the home page to the product detail page by clicking on a product", () => {
    cy.contains("My Cart (0)")
    cy.get('.products article div form button').first().click({ force: true })
    cy.contains("My Cart (1)")
  });
})