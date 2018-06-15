# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180613234205) do

  create_table "apartamentos", force: :cascade do |t|
    t.string   "unidade"
    t.boolean  "ativo"
    t.datetime "data_inclusao"
    t.datetime "data_alteracao"
    t.integer  "condominio_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["condominio_id"], name: "index_apartamentos_on_condominio_id"
  end

  create_table "compromissos", force: :cascade do |t|
    t.string   "titulo"
    t.text     "texto"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "condominios", force: :cascade do |t|
    t.decimal  "saldo"
    t.decimal  "fundo_reserva"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "nome"
  end

  create_table "descricao_tipos", force: :cascade do |t|
    t.string   "nome"
    t.string   "natureza"
    t.decimal  "valor_fixo"
    t.boolean  "ativo"
    t.datetime "data_inclusao"
    t.datetime "data_alteracao"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "despesas", force: :cascade do |t|
    t.date     "data"
    t.decimal  "valor"
    t.string   "natureza"
    t.boolean  "ativo"
    t.datetime "data_inclusao"
    t.datetime "data_alteracao"
    t.integer  "descricao_tipo_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["descricao_tipo_id"], name: "index_despesas_on_descricao_tipo_id"
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "tel"
    t.string   "dias_autorizados"
    t.boolean  "ativo"
    t.datetime "data_inclusao"
    t.datetime "data_alteracao"
    t.integer  "apartamento_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["apartamento_id"], name: "index_funcionarios_on_apartamento_id"
  end

  create_table "moradors", force: :cascade do |t|
    t.string   "nome"
    t.string   "rg"
    t.string   "cpf"
    t.string   "tel_residencial"
    t.string   "tel_celular"
    t.string   "tel_comercial"
    t.string   "ramal"
    t.string   "email"
    t.string   "parentesco"
    t.string   "tipo"
    t.boolean  "ativo"
    t.datetime "data_inclusao"
    t.datetime "data_alteracao"
    t.integer  "apartamento_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["apartamento_id"], name: "index_moradors_on_apartamento_id"
  end

  create_table "receita_a_recebers", force: :cascade do |t|
    t.decimal  "valor"
    t.date     "data"
    t.string   "natureza"
    t.boolean  "ativo"
    t.datetime "data_inclusao"
    t.datetime "data_alteracao"
    t.integer  "apartamento_id"
    t.integer  "descricao_tipo_id"
    t.integer  "morador_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["apartamento_id"], name: "index_receita_a_recebers_on_apartamento_id"
    t.index ["descricao_tipo_id"], name: "index_receita_a_recebers_on_descricao_tipo_id"
    t.index ["morador_id"], name: "index_receita_a_recebers_on_morador_id"
  end

  create_table "receita_recebidas", force: :cascade do |t|
    t.decimal  "valor"
    t.date     "data"
    t.boolean  "ativo"
    t.datetime "data_inclusao"
    t.datetime "data_alteracao"
    t.integer  "receita_a_receber_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["receita_a_receber_id"], name: "index_receita_recebidas_on_receita_a_receber_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "login"
    t.string   "password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "login"
    t.string   "senha"
    t.boolean  "ativo"
    t.datetime "data_inclusao"
    t.datetime "data_alteracao"
    t.integer  "condominio_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.index ["condominio_id"], name: "index_usuarios_on_condominio_id"
  end

  create_table "veiculos", force: :cascade do |t|
    t.string   "marca"
    t.string   "modelo"
    t.string   "cor"
    t.string   "placa"
    t.boolean  "ativo"
    t.datetime "data_inclusao"
    t.datetime "data_alteracao"
    t.integer  "apartamento_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["apartamento_id"], name: "index_veiculos_on_apartamento_id"
  end

end
