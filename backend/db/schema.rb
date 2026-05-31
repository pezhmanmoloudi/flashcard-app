# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2026_05_31_200000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "card_progresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "flashcard_id", null: false
    t.integer "repetitions", default: 0, null: false
    t.decimal "easiness_factor", precision: 4, scale: 2, default: "2.5", null: false
    t.integer "interval_days", default: 0, null: false
    t.datetime "next_review_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "needs_review", default: false, null: false
    t.datetime "reviewed_again_at"
    t.integer "fail_streak", default: 0, null: false
    t.integer "inbox_success_count", default: 0, null: false
    t.datetime "reinforcement_due_at"
    t.integer "last_response_time_ms"
    t.index ["flashcard_id"], name: "index_card_progresses_on_flashcard_id"
    t.index ["next_review_at"], name: "index_card_progresses_on_next_review_at"
    t.index ["reinforcement_due_at"], name: "index_card_progresses_on_reinforcement_due_at"
    t.index ["user_id", "flashcard_id"], name: "index_card_progresses_on_user_id_and_flashcard_id", unique: true
    t.index ["user_id", "needs_review"], name: "idx_card_progresses_inbox", where: "(needs_review = true)"
    t.index ["user_id"], name: "index_card_progresses_on_user_id"
  end

  create_table "decks", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_system", default: false, null: false
    t.string "level"
    t.string "language_pair"
    t.integer "position", default: 0, null: false
    t.index ["is_system"], name: "index_decks_on_is_system"
    t.index ["language_pair"], name: "index_decks_on_language_pair"
    t.index ["level"], name: "index_decks_on_level"
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "flashcard_sets", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "deck_id", null: false
    t.index ["deck_id", "position"], name: "index_flashcard_sets_on_deck_id_and_position"
    t.index ["deck_id"], name: "index_flashcard_sets_on_deck_id"
  end

  create_table "flashcards", force: :cascade do |t|
    t.string "front_text", null: false
    t.string "back_text", null: false
    t.string "source_language", null: false
    t.string "target_language", null: false
    t.text "example_sentence"
    t.string "image_url"
    t.string "audio_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "translated_sentence"
    t.text "grammar_notes"
    t.bigint "flashcard_set_id", null: false
    t.index ["flashcard_set_id"], name: "index_flashcards_on_flashcard_set_id"
  end

  create_table "quiz_questions", force: :cascade do |t|
    t.bigint "quiz_session_id", null: false
    t.bigint "flashcard_id", null: false
    t.string "question_type", null: false
    t.text "prompt", null: false
    t.jsonb "options", default: [], null: false
    t.string "correct_answer", null: false
    t.string "user_answer"
    t.boolean "answered_correctly"
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flashcard_id"], name: "index_quiz_questions_on_flashcard_id"
    t.index ["quiz_session_id", "position"], name: "index_quiz_questions_on_quiz_session_id_and_position"
    t.index ["quiz_session_id"], name: "index_quiz_questions_on_quiz_session_id"
  end

  create_table "quiz_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "quiz_type", null: false
    t.integer "total_questions", default: 0, null: false
    t.integer "correct_answers", default: 0, null: false
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "deck_id", null: false
    t.index ["deck_id"], name: "index_quiz_sessions_on_deck_id"
    t.index ["user_id", "created_at"], name: "index_quiz_sessions_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_quiz_sessions_on_user_id"
  end

  create_table "review_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "cards_reviewed", default: 0, null: false
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language_pair", null: false
    t.index ["user_id", "completed_at"], name: "index_review_sessions_on_user_id_and_completed_at"
    t.index ["user_id", "language_pair"], name: "index_review_sessions_on_user_id_and_language_pair"
    t.index ["user_id"], name: "index_review_sessions_on_user_id"
  end

  create_table "study_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "cards_studied", default: 0, null: false
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "deck_id", null: false
    t.index ["deck_id"], name: "index_study_sessions_on_deck_id"
    t.index ["user_id"], name: "index_study_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "card_progresses", "flashcards"
  add_foreign_key "card_progresses", "users"
  add_foreign_key "decks", "users", on_delete: :cascade
  add_foreign_key "flashcard_sets", "decks"
  add_foreign_key "flashcards", "flashcard_sets", on_delete: :cascade
  add_foreign_key "quiz_questions", "flashcards"
  add_foreign_key "quiz_questions", "quiz_sessions"
  add_foreign_key "quiz_sessions", "decks"
  add_foreign_key "quiz_sessions", "users"
  add_foreign_key "review_sessions", "users"
  add_foreign_key "study_sessions", "decks"
  add_foreign_key "study_sessions", "users"
end
