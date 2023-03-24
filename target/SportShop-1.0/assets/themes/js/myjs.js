function changeImage(param) {
	var idImg = param;
	$.ajax({
		url: "/SportShop/ChangeImageProduct",
		type: 'get',
		data: {
			imgItem: idImg
		},
		success: function(value) {
			var main = $("#mainImg");
			main.empty();
			main.append(value);
		},
		error: function(xhr) {
			// Hmmm
		}
	})
}

$("body").on("click", ".more", function() {
	$(this).remove();
	var clone = $("#ProductDetails").clone();
	clone.removeAttr("id");
	$("#containerDetail").append(clone);
})

$("#addProduct").click(function(event) {
	event.preventDefault();
	var formdata = $("#formAddProduct").serializeArray();
	json = {};
	arrayDetail = [];
	arrayImage = [];
	$.each(formdata, function(i, field) {
		json[field.name] = field.value;
	});

	$("#containerImage > .Images").each(function() {
		objectImage = {};
		img = $(this).find(".img").val();
		var imgg = img.substr(12, 100);
		var image = imgg.split(".");
		objectImage['img'] = image[0];
		arrayImage.push(objectImage);
	});

	json["Images"] = arrayImage;

	$("#containerDetail > .ProductDetails").each(function() {
		objectDetail = {};
		size = $(this).find("#size").val();
		price = $(this).find("#price").val();
		inventory = $(this).find("#inventory").val();
		objectDetail['size'] = size;
		objectDetail['price'] = price;
		objectDetail['inventory'] = inventory;

		arrayDetail.push(objectDetail);
	});

	json["ProductDetails"] = arrayDetail;

	$.ajax({
		url: "/SportShop/addNewProduct",
		type: 'POST',
		data: {
			datajson: JSON.stringify(json)
		},
		success: function(value) {
			swal("Added new products!")
				.then((value) => {
					window.location.reload();
				});
		},
		error: function(xhr) {
			swal("Oops", "Something went wrong!", "error");
		}
	});
	console.log(json);
})

var files = []
var imgName = "";
$("#image").change(function(event) {
	files = event.target.files;
	var splits = files[0].name;
	imgName = splits.split('C:\\fakepath\\');
	forms = new FormData();
	forms.append("file", files[0])

	$.ajax({
		url: "/SportShop/UploadFile",
		type: 'POST',
		data: forms,
		contentType: false,
		processData: false,
		enctype: "multipart/form-data",
		success: function(value) {

		},
		error: function(xhr) {
			// Hmmm
		}
	})
})

$("#image1").change(function(event) {
	files = event.target.files;
	var splits = files[0].name;
	imgName = splits.split('C:\\fakepath\\');
	forms = new FormData();
	forms.append("file", files[0])

	$.ajax({
		url: "/SportShop/UploadFile1",
		type: 'POST',
		data: forms,
		contentType: false,
		processData: false,
		enctype: "multipart/form-data",
		success: function(value) {

		},
		error: function(xhr) {
			// Hmmm
		}
	})
})

$("#image2").change(function(event) {
	files = event.target.files;
	var splits = files[0].name;
	imgName = splits.split('C:\\fakepath\\');
	forms = new FormData();
	forms.append("file", files[0])

	$.ajax({
		url: "/SportShop/UploadFile2",
		type: 'POST',
		data: forms,
		contentType: false,
		processData: false,
		enctype: "multipart/form-data",
		success: function(value) {

		},
		error: function(xhr) {
			// Hmmm
		}
	})
})

$("#editProduct").click(function(event) {
	event.preventDefault();
	var formdata = $("#formEditProduct").serializeArray();
	json = {};
	$.each(formdata, function(i, field) {
		json[field.name] = field.value;
	});

	$.ajax({
		url: "/SportShop/editProduct",
		type: 'POST',
		data: {
			datajson: JSON.stringify(json)
		},
		success: function(value) {
			swal("Edit product information successfully!!!")
				.then((value) => {
					window.location.reload("#example");
				});
		},
		error: function(xhr) {
			swal("Oops", "Something went wrong!", "error");
		}
	});
	console.log(json);
})

function deleteThis(param) {
	var id = param;
	swal({
		title: "Are you sure?",
		text: "Once deleted, you will not be able to recover this product!",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
		.then((willDelete) => {
			if (willDelete) {
				$.ajax({
					url: "/SportShop/DeleteProduct",
					type: 'get',
					data: {
						proItem: id
					},
					success: function(value) {
						swal("Product has been deleted")
							.then((value) => {
								window.location.reload("#example");
							});
					},
					error: function(xhr) {

					}
				})
			} else {
				swal("Your product is safe!");
			}
		});
}

$("#importProduct").click(function(event) {
	event.preventDefault();
	var formdata = $("#formImportProduct").serializeArray();
	json = {};
	arrayDetail = [];
	$.each(formdata, function(i, field) {
		json[field.name] = field.value;
	});

	$("#details").each(function() {
		object = {};
		id = $(this).find("#id").val();
		imp = $(this).find("#import").val();
		object['id'] = id;
		object['import'] = imp;
		arrayDetail.push(object);
	});

	json["listDetail"] = arrayDetail;

	console.log(json);

	$.ajax({
		url: "/SportShop/importProduct",
		type: 'POST',
		data: {
			datajson: JSON.stringify(arrayDetail)
		},
		success: function(value) {
			swal("Import product successfully!")
				.then((value) => {
					window.location.reload("#example");
				});
		},
		error: function(xhr) {
			swal("Oops", "Something went wrong!", "error");
		}
	});
})

$("#exportProduct").click(function(event) {
	event.preventDefault();
	var formdata = $("#formExportProduct").serializeArray();
	json = {};
	arrayDetail = [];
	$.each(formdata, function(i, field) {
		json[field.name] = field.value;
	});

	$("#details").each(function() {
		object = {};
		id = $(this).find("#id").val();
		imp = $(this).find("#export").val();
		object['id'] = id;
		object['export'] = imp;
		arrayDetail.push(object);
	});

	console.log(arrayDetail);
	json["listDetail"] = arrayDetail;

	$.ajax({
		url: "/SportShop/exportProduct",
		type: 'POST',
		data: {
			datajson: JSON.stringify(arrayDetail)
		},
		success: function(value) {
			swal("Export product successfully!")
				.then((value) => {
					window.location.reload("#example");
				});
		},
		error: function(xhr) {
			swal("Oops", "Something went wrong!", "error");
		}
	});
})

function editStatus(param) {
	var id = param;
	swal({
		title: "Are you sure?",
		text: "Want to change the status of this account?",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
		.then((willDelete) => {
			if (willDelete) {
				$.ajax({
					url: "/SportShop/editStatus",
					type: 'get',
					data: {
						acc: id
					},
					success: function(value) {
						window.location.reload(".customerDetail");
					},
					error: function(xhr) {

					}
				})
			} else {
				swal("Cancel success!");
			}
		});
}

function deleteAccount(param) {
	var id = param;
	swal({
		title: "Are you sure?",
		text: "Want to delete this account?",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
		.then((willDelete) => {
			if (willDelete) {
				$.ajax({
					url: "/SportShop/deleteAccount",
					type: 'get',
					data: {
						acc: id
					},
					success: function(value) {
						swal("Delete account successfully!!!")
							.then((value) => {
								window.location.reload("#example");
							});
					},
					error: function(xhr) {
						swal("Oops", "Something went wrong!", "error");
					}
				})
			} else {
				swal("Cancel success!");
			}
		});
}

function editStatusAdmin(param) {
	var id = param;
	swal({
		title: "Are you sure?",
		text: "Want to change the status of this account?",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
		.then((willDelete) => {
			if (willDelete) {
				$.ajax({
					url: "/SportShop/editStatusAdmin",
					type: 'get',
					data: {
						acc: id
					},
					success: function(value) {
						window.location.reload(".customerDetail");
					},
					error: function(xhr) {

					}
				})
			} else {
				swal("Cancel success!");
			}
		});
}

function deleteAccountAdmin(param) {
	var id = param;
	swal({
		title: "Are you sure?",
		text: "Want to delete this account?",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
		.then((willDelete) => {
			if (willDelete) {
				$.ajax({
					url: "/SportShop/deleteAccountAdmin",
					type: 'get',
					data: {
						acc: id
					},
					success: function(value) {
						swal("Delete account successfully!")
							.then((value) => {
								window.location.reload("#example");
							});
					},
					error: function(xhr) {
						swal("Oops", "Something went wrong!", "error");
					}
				})
			} else {
				swal("Cancel success!");
			}
		});
}

function process(param, param2) {
	var id = param;
	var staffId = param2
	swal({
		title: "Are you sure?",
		text: "Want to process now?",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
		.then((willDelete) => {
			if (willDelete) {
				$.ajax({
					url: "/SportShop/process",
					type: 'get',
					data: {
						inv: id,
						staff: staffId
					},
					success: function(value) {
						window.location.reload(".invoiceDetail");
					},
					error: function(xhr) {

					}
				})
			} else {
				swal("Cancel success!");
			}
		});
}

function deleteInvoice(param) {
	var id = param;
	swal({
		title: "Are you sure?",
		text: "Want to delete this invoice now?",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
		.then((willDelete) => {
			if (willDelete) {
				$.ajax({
					url: "/SportShop/deleteInvoice",
					type: 'get',
					data: {
						id: id
					},
					success: function(value) {
						swal("Delete invoice successfully!")
							.then((value) => {
								window.location.reload();
							});
					},
					error: function(xhr) {

					}
				})
			} else {
				swal("Cancel success!");
			}
		});
}

$("#editAccount").click(function(event) {
	event.preventDefault();
	var formdata = $("#formEditAccountAdmin").serializeArray();
	json = {};
	$.each(formdata, function(i, field) {
		json[field.name] = field.value;
	});

	$.ajax({
		url: "/SportShop/editProfileAdmin",
		type: 'POST',
		data: {
			datajson: JSON.stringify(json)
		},
		success: function(value) {
			swal("Edit product information successfully!!!")
				.then((value) => {
					window.location.reload();
				});
		},
		error: function(xhr) {
			swal("Oops", "Something went wrong!", "error");
		}
	});
	console.log(formdata);
})

$("#changePassword").click(function(event) {
	event.preventDefault();
	var formdata = $("#changePasswordAdmin").serializeArray();
	json = {};
	$.each(formdata, function(i, field) {
		json[field.name] = field.value;
	});

	$.ajax({
		url: "/SportShop/changePasswordAdmin",
		type: 'POST',
		data: {
			datajson: JSON.stringify(json)
		},
		success: function(value) {
			swal("Change password successfully!")
				.then((value) => {
					window.location.reload();
				});
		},
		error: function(xhr) {
			swal("Oops", "Something went wrong!", "error");
		}
	});
	console.log(formdata);
})