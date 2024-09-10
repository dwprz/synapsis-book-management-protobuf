GO_MODULE := github.com/dwprz/synapsis-book-management-protobuf

.PHONY: clean
clean: 
	rm --force --recursive ./protogen 
	mkdir -p ./protogen

.PHONY: protoc-go
protoc-go:
	protoc --go_opt=module=${GO_MODULE} --go_out=. \
	--go-grpc_opt=module=${GO_MODULE} --go-grpc_out=. \
	./proto/book/*.proto ./proto/book/type/*.proto \
	./proto/book_category/*.proto ./proto/book_category/type/*.proto \

.PHONY: build
build: clean protoc-go

.PHONY: licenses
licenses:
	rm -rf ./LICENSES
	go-licenses save ./... --save_path=./LICENSES