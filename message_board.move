module message_board::message_board {

    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};

    struct Message has key {
        id: UID,
        content: vector<u8>,
    }

    public entry fun create_message(content: vector<u8>, ctx: &mut TxContext): Message {
        Message {
            id: object::new(ctx),
            content,
        }
    }

    public entry fun update_message(msg: &mut Message, new_content: vector<u8>) {
        msg.content = new_content;
    }

    public fun read_message(msg: &Message): vector<u8> {
        msg.content
    }
}