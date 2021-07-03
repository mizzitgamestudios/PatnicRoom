import numpy as np
from pandas._typing import ArrayLike as ArrayLike
from pandas.core.dtypes.dtypes import ExtensionDtype as ExtensionDtype
from pandas.core.dtypes.generic import ABCExtensionArray as ABCExtensionArray
from typing import Sequence, Tuple, Union

def try_cast_to_ea(cls_or_instance, obj, dtype = ...): ...

class ExtensionArray:
    def __getitem__(self, item) -> None: ...
    def __setitem__(self, key: Union[int, np.ndarray], value) -> None: ...
    def __len__(self) -> int: ...
    def __iter__(self) : ...
    def to_numpy(self, dtype = ..., copy: bool = ..., na_value = ...): ...
    @property
    def dtype(self) -> ExtensionDtype: ...
    @property
    def shape(self) -> Tuple[int, ...]: ...
    @property
    def ndim(self) -> int: ...
    @property
    def nbytes(self) -> int: ...
    def astype(self, dtype, copy: bool = ...): ...
    def isna(self) -> ArrayLike: ...
    def argsort(self, ascending: bool=..., kind: str=..., *args, **kwargs) -> np.ndarray: ...
    def fillna(self, value = ..., method = ..., limit = ...): ...
    def dropna(self): ...
    def shift(self, periods: int=..., fill_value: object=...) -> ABCExtensionArray: ...
    def unique(self): ...
    def searchsorted(self, value, side: str = ..., sorter = ...): ...
    def factorize(self, na_sentinel: int=...) -> Tuple[np.ndarray, ABCExtensionArray]: ...
    def repeat(self, repeats, axis = ...): ...
    def take(self, indices: Sequence[int], allow_fill: bool=..., fill_value=...) -> ABCExtensionArray: ...
    def copy(self) -> ABCExtensionArray: ...
    def view(self, dtype=...) -> Union[ABCExtensionArray, np.ndarray]: ...
    def ravel(self, order=...) -> ABCExtensionArray: ...

class ExtensionOpsMixin: ...
class ExtensionScalarOpsMixin(ExtensionOpsMixin): ...
