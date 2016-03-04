require 'spec_helper'

describe SpeciesController do
  render_views

  let(:species) { Species.find(1) }

  context 'index' do

    before(:each) do
      visit species_index_path
    end

    it 'should render the index view' do
      response.should be_success
      response.should render_template(:index)
    end

    it 'should render the app title' do
      page.should have_css('h1#main_title')
    end

    it 'should render the app menu' do
      page.should have_css('div.menu')
    end

    it 'should have a page title' do
      page.should have_css('h1.page_title')
    end

    it 'should have a table of species' do
      page.should have_css('table.index_table')
    end

    it 'should show us the Cat species' do
      page.should have_text('Cat')
      page.should have_text('Felis Cattus')
    end

    it 'should show us the Dog species' do
      page.should have_text('Dog')
      page.should have_text('Canis Canis')
    end

    it 'should have an edit link for cat' do
      page.should have_link('Edit')
    end

    it 'should have a DESTROY link for cat' do
      page.should have_link('DESTROY')
    end

  end

  context 'new' do

    before(:each) do
      visit new_species_path
    end

    it 'should render the new page' do
      response.should be_success
      response.should render_template(:new)
    end

    it 'should render the app title' do
      page.should have_css('h1#main_title')
    end

    it 'should render the app menu' do
      page.should have_css('div.menu')
    end

    it 'should have fields for a species' do
      page.should have_css('input#species_name')
      page.should have_css('input#species_latin_name')
      page.should have_css('input#species_no_of_legs')
    end

    it 'have a save button' do
      page.should have_css('input#species_submit')
    end

  end

  context 'edit' do

    before(:each) do
      visit edit_species_path(species)
    end

    it 'should render the app title' do
      page.should have_css('h1#main_title')
    end

    it 'should render the app menu' do
      page.should have_css('div.menu')
    end

    it 'should render the edit page' do
      response.should be_success
      response.should render_template(:edit)
    end

    it 'should have fields for a species' do
      page.should have_css('input#species_name')
      page.should have_css('input#species_latin_name')
      page.should have_css('input#species_no_of_legs')
    end

    it 'have a save button' do
      page.should have_css('input#species_submit')
    end

  end

  context 'show' do

    before(:each) do
      visit species_path(species)
    end

    it 'should render the app title' do
      page.should have_css('h1#main_title')
    end

    it 'should render the app menu' do
      page.should have_css('div.menu')
    end

    it 'should render the edit page' do
      response.should be_success
      response.should render_template(:show)
    end

  end

end
