from typing import Dict, List, Pattern, Text, Tuple, Union
from typing_extensions import Literal

_DEFAULT_DELIMITER: str

def emojize(
    string: str,
    use_aliases: bool = ...,
    delimiters: Tuple[str, str] = ...,
    variant: Literal["text_type", "emoji_type", None] = ...,
    language: str = ...,
) -> str: ...
def demojize(string: str, use_aliases: bool = ..., delimiters: Tuple[str, str] = ..., language: str = ...) -> str: ...
def get_emoji_regexp(language: str = ...) -> Pattern[Text]: ...
def emoji_lis(string: str, language: str = ...) -> List[Dict[str, Union[int, str]]]: ...
def distinct_emoji_lis(string: str) -> List[str]: ...
def emoji_count(string: str) -> int: ...
