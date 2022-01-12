-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 11, 2022 lúc 01:10 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `book_store_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `books`
--

CREATE TABLE `books` (
  `id` int(30) NOT NULL,
  `category_ids` text NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` text NOT NULL,
  `description` text NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `image_path` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `books`
--

INSERT INTO `books` (`id`, `category_ids`, `title`, `author`, `description`, `qty`, `price`, `image_path`, `date_created`) VALUES
(11, '6', 'Bàn Về Khế Ước Xã Hội', 'Omega Plus', 'Năm Xuất Bản: 03/2018\r\n\r\nKích Thước: 14x 20.5\r\n\r\nNhà Xuất bản: NXB Thế Giới\r\n\r\nSố Trang: 312\r\n\r\nKhế ước xã hội là tên gọi vắn tắt của bản luận văn lớn mà J. J. Rousseau đặt dưới một nhan đề khá dài: \r\nBàn về khế ước xã hội hay là các nguyên tắc của quyền chính trị (Du Contrat social – ou principes du droit \r\npolitique).\r\n \r\nVề lai lịch cuốn sách, tác giả viết: “Luận văn nhỏ này trích từ một công trình nghiên cứu rộng lớn mà trước \r\nkia tôi đã viết, nhưng vì chưa lượng được sức mình nên phải bỏ đi từ lâu”.\r\n\r\nNhững tư tưởng của Khế ước xã hội đã lay động bao lớp người không thỏa hiệp với chế độ quân chủ chuyên chế \r\nthời ấy; và khi cuộc Cách mạng Pháp kết thúc năm 1794, Hội nghị Quốc ước đã quyết định đưa hình tượng và tro \r\nhài của Jean-Jacques Rousseau vào Điện Panthéon, nơi chôn cất và lưu niệm các bậc vĩ nhân đã làm vẻ vang cho \r\nnước Pháp.\r\n\r\nTrên 200 năm đã trôi qua, kể từ ngày Khế ước xã hội ra đời mà luồng sáng do tác phẩm rọi ra vẫn còn ánh lên \r\ntrước mắt chúng ta ngày nay.', 150, 118750, '1641892140_khe_uoc_xa_hoi_thumb.png', '2021-12-27 22:31:30'),
(12, '6', 'Chính Trị - Khái Lược Những Tư Tưởng Lớn', 'Bích Thu', 'Dịch giả: Bích Thu \r\n\r\nNăm xuất bản: 2019\r\n\r\nSố trang: 352\r\n\r\nKích thước: 19,3 x 23,5 cm\r\n\r\nCó đúng chăng khi chúng ta lật đổ một nhà cai trị bất công? Liệu nền dân chủ có thực sự là hình thức chính \r\nquyền tốt nhất? Và chiến tranh có thể được biện minh hay không? Xuyên suốt chiều dài lịch sử, loài người đã \r\ntự hỏi mình những điều này cùng những câu hỏi lớn lao khác về cách thức tốt nhất để chúng ta cai trị chính \r\nmình và các tư tưởng gia vĩ đại đã đưa ra những lời giải đáp mà cho đến nay vẫn đang tiếp tục định hình thế \r\ngiới.\r\n\r\nVới văn phong dễ hiểu và sáng sủa, Chính trị - Khái Lược Những Tư Tưởng Lớn là tập hợp những bài viết ngắn \r\ngọn hàm súc giải thích rõ những điều khó hiểu, những sơ đồ từng bước giúp làm sáng tỏ những lí thuyết rối \r\nrắm và những hình ảnh minh họa dí dỏm giúp chúng ta ý thức rõ hơn về vai trò của mình trong cách thức tổ \r\nchức xã hội.\r\n\r\n', 90, 261300, '1641897960_chinh-tri-khai-luoc-nhung-tu-tuon.png', '2021-12-28 07:20:17'),
(13, '7', 'PHÂN TÍCH MẪU HÌNH BIỂU ĐỒ ', 'Mehran Kamrava', 'NCC:Công ty TNHH Phạm Lê Minh\r\n\r\nDịch Giả:Trương Minh Huy, Khúc Ngọc Tuyên\r\n\r\nLoại bìa:Bìa cứng\r\n\r\nSố trang:290\r\n\r\nNXB:nxb hong duc\r\n\r\nCó rất nhiều sách trên thị trường, dành cho cả người mới bắt đầu và người đã có kinh nghiệm, đề cập đến các trụ cột khác trong giao dịch, có thể là về tâm lý học hay các nguyên tắc quản trị tiền. Tuy nhiên, không có quá nhiều tài liệu nói về nghệ thuật phân tích kỹ thuật, và cũng tương đối ít tài liệu nói về phân tích các mẫu hình biểu đồ, vốn là trái tim trong chiến lược của Dan Zanger.\r\n\r\nChính Dan Zanger là người đã phổ biến các cuốn sách của Schabacker, Edwards và Magee khi nhà giao dịch siêu hạng này chứng minh cho cả thế giới thấy kỹ thuật này có thể mạnh mẽ đến mức nào. Ông đã khiến cả thế giới phải kinh ngạc vào năm 2000 khi tích lũy được 42 triệu đô la chỉ với số vốn ban đầu 11 nghìn đô la, trong vòng 23 tháng giao dịch các cổ phiếu trong “siêu sóng” tăng giá trên sàn NASDAQ. Hiệu suất đáng kinh ngạc của ông đã chứng minh cho chúng ta thấy hiệu quả của kỹ thuật này. Ông cũng chứng minh phân tích mẫu hình biểu đồ vẫn rất phù hợp trong môi trường thị trường ngày nay, chẳng khác gì khi nó được Schabacker phát hiện lần đầu tiên vào đầu những năm 1930.', 60, 84000, '1641901140_phantich.PNG', '2021-12-28 07:21:24'),
(14, '6', 'Quân Vương - Thuật Cai Trị ', 'Niccolò Machiavelli', 'Kích thước:14 x 20.5 cm\r\n\r\nDịch Giả:	Vũ Thái Hà\r\n\r\nLoại bìa:	Bìa mềm\r\n\r\nSố trang:	200\r\n\r\nNXB: Nhà Xuất Bản Thế Giới\r\nQuân Vương – Thuật Cai Trị (Tái Bản 2018) là cuốn sách gối đầu giường của rất nhiều thế hệ chính trị gia và \r\nlãnh đạo trên thế giới.\r\n\r\nCuốn sách nhỏ của Niccolò Machiavelli đã hội tự những nguyên tắc làm nền móng cho khoa học quản trị nói \r\nchung và chính trị học nói riêng.\r\n\r\nNgười ta sẽ luôn đọc Quân vương chừng nào con người vẫn chưa thôi trò chơi nguy hiểm nhưng hấp dẫn có cái \r\ntên \"chính trị\".\r\n\r\nQua cuốn sách, độc giả sẽ tìm ra chân dung một vị quân vương hình mẫu : keo kiệt hay rộng lượng, độc ác hay \r\nnhân từ, thất hứa hay giữ lời nếu lời hứa đi ngược lại lợi ích của mình, phải làm gì để tránh bị dân chúng \r\ncăm ghét, phải thực thi những hành động lớn lao để nâng cao uy tín của mình.\r\n\r\nCuốn sách bàn về khoa học chính trị của nhà ngoại giao, nhà triết học và nhà quân sự người Ý – \r\nNiccolò Machiavelli. Xuất hiện lần đầu tiên vào năm 1513 nhưng mãi đến năm 1532, ấn bản đầu tiên mới được \r\nchính thức xuất bản dưới sự cho phép của Giáo hoàng Clement VII.\r\n', 130, 76300, '1641898620_Quân.png', '2021-12-28 07:22:28'),
(15, '7', 'Internet Of Things - Các Vấn Đề Hiện Nay', 'Timothy Chou', 'NXB:Công Ty Cổ Phần Tri thức Văn Hóa Sách Việt Nam\r\n\r\nLoại bìa:Bìa mềm\r\n\r\nSố trang:186\r\n\r\nNXB:Nhà Xuất Bản Hà Nội\r\n\r\nChính Xác (Precision) là một bản trình bày phản ánh đúng những thách thức phức tạp phải đối mặt của các \r\nchuyên gia dữ liệu, nhà công nghệ và doanh nhân - những người đang phải giải quyết một số thách thức vận \r\nhành lớn nhất thế giới thông qua Internet Vạn vật (Internet of Things - IoT), dữ liệu lớn và học máy. Nếu \r\nbạn muốn đi xa hơn sự cường điệu và thực sự hiểu những gì Internet Vạn vật (IoT) của ngày nay, những gì nó \r\ncó thể trở thành của ngày mai, và làm thế nào để đạt được giá trị của nó thì cuốn Chính Xác phải nằm trong \r\ntủ sách của bạn.\r\n\r\nCó thể bạn không chắc tại sao máy pha cà phê lại cần phải nói chuyện với lò nướng, nhưng công nghệ chính xác \r\nđang làm cho Internet Vạn vật (IoT) có thể thay đổi hành tinh này. Giúp làm sáng tỏ, Tiến sĩ Timothy Chou đã \r\nviết ra quyển Chính Xác (Precision) để giới thiệu cho chúng ta những điều cơ bản về Internet Vạn vật (IoT) \r\ncủa doanh nghiệp.', 50, 125000, '1641900180_iot.png', '2021-12-28 07:24:03'),
(18, '7', 'Phương Pháp Wyckoff Hiện Đại - Kỹ thuật Nhận diện Xu hướng Thị trường Tiềm năng', 'Peter Townsend', 'Dịch Giả	TraderViet Team - Hiệu đính: Mạc An\r\n\r\nLoại bìa	Bìa cứng\r\n\r\nSố trang	308\r\n\r\nNhà xuất bản	Nhà Xuất Bản \r\nThanh Niên\r\n\r\nKỹ thuật, công nghệ đóng vai trò quan trọng, tạo nên những bước phát triển đột phá của xã hội loài người, \r\ntừ hàng nghìn năm trước đây cũng như trong bối cảnh Cách mạng công nghiệp lần thứ tư hiện nay. Những phát \r\nminh của con người từ viên đá lửa cho đến các công cụ bằng kim loại, động cơ hơi nước, năng lượng điện, \r\nbóng bán dẫn cho đến máy tính điện tử, mạng Internet, trí tuệ nhân tạo,... là nền móng, trụ cột cho sự phát \r\ntriển của tất cả các ngành và lĩnh vực. Nhờ có tiến bộ khoa học - công nghệ mà năng suất lao động tăng nhanh,\r\n người dân ở nhiều quốc gia trở nên giàu có, sung túc, khỏe mạnh và sống lâu hơn. Tuy nhiên, các phát minh, \r\nsáng chế có thể có những tác động phụ, tiêu cực đến đời sống con người cũng như môi trường sinh thái tự nhiên.', 30, 145000, '1641900660_wofk.PNG', '2021-12-28 07:27:08'),
(19, '8', '5 Centimet Trên Giây - One More Side', 'Shinkai Makoto', 'NXB: Hồng Đức\r\n\r\nNăm XB: 2020\r\n\r\nNgôn Ngữ: Tiếng Việt\r\n\r\nTrọng lượng (gr):300\r\n\r\nKích Thước: 13 x 18 cm\r\n\r\nHình thức: Bìa Mềm\r\n\r\nNếu coi tiểu thuyết 5 ENTIMET TRÊN GI Y là một bức tranh hép hình, khắc họa chuyện đời, huyện tình của \r\nTono Takaki, thì 5 CENTIMET TRÊN GI Y ONE MORE SIDE giống như phần mở rộng và hoàn thiện của bức tranh ấy.\r\n\r\nNhững mảnh ghép vốn có được thay mới cả về nội dung và cách thể hiện. Những mảnh ghép ẩn được hé lộ đầy đủ \r\nvà sáng tỏ. Bức tranh tổng thể vì thế mà toàn vẹn hơn, đa chiều hơn.\r\n\r\nĐược chắp bút bởi tác giả quen thuộc Kanoh Arata, 5 CENTIMET TRÊN GIÂY - ONE MORE SIDE sẽ đưa độc giả tiếp \r\ncận câu chuyện đượm buồn nhưng tuyệt đẹp của Shinkai Makoto một lần nữa, qua “một góc nhìn khác”.', 200, 73000, '1640705280_5-centimet-tren-giay-one-more-side.png', '2021-12-28 07:28:28'),
(20, '8', 'Heidi ', 'Johanna Spyri', 'Số trang: 304\r\n\r\nKích thước: 13.5cm x 20.5cm\r\n\r\nNgày xuất bản: 05-2011\r\n\r\nNhà xuất bản: Nhà Xuất Bản Văn Học\r\n\r\nCông ty Phát hành: Công Ty Cổ Phần Văn Hóa Đông A\r\n\r\nNội dung tác phẩm: Vì vội vã đi kiếm việc làm mới, người dì ích kỉ đã gửi Heidi đến cho ông nội của cô bé, \r\nđang sống cô độc trên vùng núi Alm. Ai cũng ái ngại cho Heidi khi phải sống với ông già lập dị và cục cằn ấy. Nhưng ai ngờ được rằng, Heidi bé bỏng với tấm lòng nhân hậu tự nhiên, chẳng những giúp ông nội tìm lại lòng yêu cuộc sống, mà còn mang đến bao đổi thay kì diệu. Những ai từng gặp Heidi, dù ở Dörfli hay Frankfurt, đều muốn cô bé mãi mãi ở bên mình. Nhưng tất cả đều hiểu, chỉ ở giữa cánh đồng hoa rực rỡ, thung lũng mênh mông và ráng chiều rực đỏ trên những ngọn núi thanh tĩnh ngàn đời của dãy Alm, Heidi mới thực sự hạnh phúc để tặng niềm vui cho mọi người.\r\n\r\nRa đời cách đây 140 năm, Heidi của nữ nhà văn Johanna Spyri được coi là một tác phẩm kinh điển dành cho thiếu\r\n nhi. Với văn phong giản dị, trong sáng, tác phẩm này đem đến cho người đọc những bức tranh thiên nhiên thơ \r\nmộng, hùng vĩ của đất nước Thụy Sĩ, cùng những điều bí ẩn của tạo vật và tâm hồn con trẻ. Heidi đã nhiều lần \r\nđược chuyển thể thành phim điện ảnh, phim truyền hình, kịch bản sân khấu và anime.\r\n\r\nCuốn sách kinh điển của Johanna Spyri đã được Đông A xuất bản với bản dịch được yêu thích của dịch giả Thanh \r\nVân, minh họa của Elena Selivanova. Sách in màu, bìa cứng, có bìa áo.', 20, 156000, '1641893760_Heidi.png', '2021-12-28 07:29:27'),
(21, '8', 'Kiếp Nào Ta Cũng Tìm Thấy Nhau', 'Brain L. Weiss ', 'NXB:Thái Hà Book\r\n\r\nLoại bìa:Bìa mềm\r\n\r\nSố trang:	290\r\n\r\nNXB:Nhà Xuất Bản Lao Động\r\n\r\nKiếp nào ta cũng tìm thấy nhau là cuốn sách thứ ba của Brain L. Weiss – một nhà tâm thần học có tiếng. \r\nTrước đó ông đã viết hai cuốn sách: cuốn đầu tiên là Ám ảnh từ kiếp trước, cuốn sách mô tả câu chuyện có \r\nthật về một bệnh nhân trẻ tuổi cùng với những liệu pháp thôi miên về kiếp trước đã làm thay đổi cả cuộc đời \r\ntác giả lẫn cô ấy. Cuốn sách đã bán chạy trên toàn thế giới với hơn 2 triệu bản in và được dịch sang hơn 20 \r\nngôn ngữ. Cuốn sách thứ hai Through  Time  into  Healing (Đi  qua  thời  gian  để chữa lành), mô tả những gì \r\ntác giả đã học được về tiềm năng chữa bệnh của liệu pháp hồi quy tiền kiếp. Trong cuốn sách đều là những câu \r\nchuyện người thật việc thật. Nhưng  câu  chuyện  hấp  dẫn  nhất lại  nằm  trong cuốn sách thứ ba.\r\n\r\nKiếp nào ta cũng tìm thấy nhau nói về những linh hồn tri kỷ, những người có mối liên kết vĩnh viễn với nhau \r\nbằng tình yêu thương, luôn gặp lại nhau hết lần này đến lần khác, qua hết kiếp này tới kiếp khác. Chúng ta \r\nsẽ tìm thấy và nhận ra tri kỷ của mình như thế nào, rồi đưa ra những quyết định làm thay đổi cuộc sống của \r\nchính mình ra sao là những khoảnh khắc quan trọng và xúc động nhất trong cuộc đời mỗi người.\r\n\r\nĐịnh  mệnh  sẽ dẫn  lối cho  những  linh  hồn tri  kỷ hội ngộ. Chúng ta sẽ gặp họ. Nhưng quyết định làm gì \r\nsau đó lại là quyền tự do lựa chọn của mỗi người. Một lựa chọn sai lầm hoặc một cơ hội bị bỏ lỡ có thể dẫn \r\nđến nỗi cô đơn và thống khổ tột cùng. Và một lựa chọn đúng đắn, một cơ hội được nắm bắt có thể mang lại niềm \r\nhạnh phúc sâu sắc.\r\n', 60, 51850, '1640705400_Kiep-nao-ta-cung-tim-thay-nhau.png', '2021-12-28 07:30:09'),
(22, '8', 'Những Người Đàn Bà', ' Etaf Rum', 'Thể loại: Tiểu thuyết, văn học hiện đại\r\n\r\nThương hiệu: I love Books\r\n\r\nNhà xuất bản: NXB Thế giới\r\n\r\nThương hiệu: I love Books\r\n\r\nNăm xuất bản: 20/4/2020\r\n\r\nNHỮNG NGƯỜI ĐÀN BÀ là câu chuyện đầy đau đớn, dữ dội về số phận của những người phụ nữ yếm thế trong xã hội \r\nPalestine. Họ không có tiếng nói ngay trong gia đình mình, lấy chồng theo sự sắp đặt của cha mẹ và chỉ quẩn \r\nquanh bên căn bếp, chăm lo con cái.\r\n\r\nXuyên suốt câu chuyện là sự câm lặng của ba thế hệ phụ nữ. Thế hệ đầu thoát khỏi sự chiếm đóng của Israel \r\ntrong xung đột Palestine và Israel, chạy trốn đến nước Mỹ với mong muốn tránh khỏi cuộc sống ở trại tị nạn. \r\nThế hệ thứ 2 đồng ý một cuộc hôn nhân sắp đặt với người Mỹ gốc Palestine với hi vọng đất Mỹ tự do thì tiếng \r\nnói của nữ giới sẽ được tôn trọng hơn trên đất Palestine. Thế hệ thứ 3, suýt nữa thì rơi vào bánh xe đổ của \r\ncác thế hệ trước, nếu cô ấy không phát hiện ra bí mật kinh khủng của gia đình mình và số phận của người mẹ \r\nđáng thươ Mỗi thế hệ đều có giấc mơ và khát vọng về sự tự do và nữ quyền, nhưng không phải ai cũng có thể \r\nđấu tranh đến tận cùng.\r\n\r\nLấy bối cảnh ở một nước Mỹ đầy khát khao cùng những lời hứa hẹn rộng mở, để kể một nền văn hóa với hủ tục cực\r\nđoan, khép kín và kiểm soát đối người phụ nữ, NHỮNG NGƯỜI ĐÀN BÀ là một cái nhìn sâu sắc về sự tuyệt vọng, \r\nthống khổ của phụ nữ gốc Palestine. Dù vậy, ẩn chứa bên trong họ là sức mạnh phi thường, lòng dũng cảm để tìm\r\nlại tiếng nói và phẩm giá của mình.\r\n', 125, 139000, '1640705520_nhung-nguoi-dan-ba.png', '2021-12-28 07:32:08'),
(23, '9', 'Hai số phận ', 'Jeffrey Archer', 'Năm xuất bản: 2018\r\n\r\nKích thước: 13.5 x 20.5 cm\r\n\r\nLoại bìa: Bìa mềm\r\n\r\nSố trang: 768\r\n\r\nHai Số Phận (có tên gốc tiếng Anh là: Kane and Abel) là một cuốn tiểu thuyết kinh điển được sáng tác vào năm 1979 bởi \r\nnhà văn người Anh Jeffrey Archer.\r\n\r\nCuốn sách là một câu chuyện kể về hai người có số phận khác nhau. Họ không có điểm gì giống nhau cả, ngoại trừ việc họ \r\nsinh ra vào cùng một thời điểm (18/04/1906) và có một lòng quyết tâm để đạt được thành công trong cuộc sống. William Kane\r\n là một người mạnh mẽ và giàu có trong khi đó Abel Rosnovski (tên ban đầu là Wladek Koskiewicz) là một người gốc Ba Lan \r\nphải đấu tranh từ lúc sinh ra và lớn lên cùng với những người nghèo khổ, cuối cùng di cư đến Hoa Kỳ. ', 70, 135000, '1641893520_hai-so-phan-bia_78f2a90270f34b8095f25f91e9a53ef7.png', '2021-12-28 07:33:45'),
(24, '9', 'Nanh trắng', 'Jack London', 'NCC: Bestbooks.vn\r\n\r\nNXB: NXB Văn Học\r\n\r\nNăm XB: 2020\r\n\r\nTrọng lượng (gr): 1000\r\n\r\nKích thước: 16 x 24 cm\r\n\r\nSố trang: 420\r\n\r\nHình thức: Bìa Cứng\r\n\r\nCuối thế kỷ XIX tại Canada, con người đổ xô đi tìm vàng tại những vùng lạnh giá phương bắc. Được thừa hưởng tất cả những \r\ngì tinh túy nhất của sói bố Một mắt và mẹ Kiche, Nanh Trắng sinh ra như để trở thành một chiến binh sói đơn độc với bản \r\nnăng sinh tồn dẻo dai đến kì lạ trong môi trường khắc nghiệt ấy.\r\n\r\nSau lần mẹ Kiche bất ngờ gặp lại những chủ cũ, Nanh Trắng bước chân vào thế giới con người. Từ đấy, cuộc sống của Nanh \r\nTrắng gắn liền vào những cuộc rượt đuổi, cắn xé nhau giữa những kẻ cùng dòng giống, những cú đạnh chí mạng khi lỡ phạm \r\nsai lầm, nhưng cơn đói triền miên tưởng có thể lìa đời, sự tù đày giam cầm tàn bạo. Thế nhưng, khi sự sống tưởng như đã \r\ntuyệt vọng, Nanh Trắng lại gặp được Weedon Scott, một con người nhân hậu. Kể từ đó, Nanh Trắng mới biết về lòng tin và \r\nlòng yêu thương...', 75, 53000, '1641899640_nanh-trang.png', '2021-12-28 07:34:41'),
(25, '9', 'Ruồi trâu', 'Ethel Lilian Voynich', 'NXB:H. Holt\r\n\r\nSố trang:	448 \r\n\r\nNCC: Nhà sách Minh Thắng\r\n\r\nKích thước: 14,5 x 20,5 cm\r\n\r\nLoại bìa: Bìa cứng\r\n\r\nRuồi trâu là một tác phẩm rất đáng đọc. Câu chuyện diễn ra vào thế kỉ 19 tại Ý. Thời đó, đất nước này đang bị chia cắt. \r\nDưới quyền kiểm soát của đế quốc Áo, các phong trào cách mạng nhằm thống nhất nước Ý đều bị đàn áp. Một thanh niên Ý kiên\r\ncường đã dành cả cuộc đời mình để đấu tranh cho lí tưởng giải phóng đất nước.\r\n\r\nCuộc đời anh chứa đựng những bí mật khiến anh bị giằng xé giữa tình yêu và nỗi tức giận, chịu đựng những nỗi đau cả về \r\nthể xác và tinh thần. Nhưng vượt lên tất cả anh đã luôn tiến về phía trước. Anh đã sống với ý chí và nghị lực đáng khâm \r\nphục.\r\n\r\nRuồi trâu gửi tới người đọc một thông điệp: Cuộc sống dù ngắn ngủi nhưng vẫn có ý nghĩa khi ta sống có lí tưởng.', 50, 107000, '1640705700_ruoi-trau.png', '2021-12-28 07:35:52'),
(26, '9', 'Tiếng gọi nơi hoang dã', 'Jack London', 'NXB: NXB Văn Học\r\n\r\nPhát hành: Minh Thắng\r\n\r\nNăm xuất bản: 2019 (ISBN: 9786049829413)(mã sách: 8935236416207)\r\n\r\nDịch giả: Hoàng Hà Vũ\r\n\r\nDạng bìa: Bìa cứng\r\n\r\nSố trang: 256 trang\r\nKích thước: 14,5 x 20,5\r\nTiếng Gọi Nơi Hoang Dã (nguyên bản tiếng Anh: The Call of the Wild) là tiểu thuyết của nhà văn Mỹ Jack London. Chuyện kể \r\nvề những chuyến phiêu lưu mạo hiểm của chú chó Bấc trung thành. Bấc đang sống trong trang trại của một gia đình giàu có \r\nthì bị bắt cóc, trở thành chó kéo xe cho những người đi tìm vàng ở khu Alaska lạnh giá. Bấc phải học cách đối diện với \r\ncuộc đấu tranh sinh tồn và trở thành thủ lĩnh của đàn chó. Thiên nhiên nguyên thủy đã đánh thức bản năng của Bấc.\r\n\r\nSau một lần đi săn trở về, Bấc nhìn thấy cái chết thương tâm của Thoóctơn - người chủ nó thương yêu nhất. Tình yêu thương,\r\n sự trung thành mà Bấc dành cho Thoóctơn trở thành nỗi đau thống thiết, Bấc trở nên hoang dã hơn bao giờ hết… Không còn \r\nmối liên hệ nào níu Bấc lại với con người, nó bị cuốn theo tiếng gọi nơi hoang dã, cuối cùng trở thành một con sói hoang.\r\n\r\nXuất bản lần đầu năm 1903, Tiếng Gọi Nơi Hoang Dã đã trở thành kiệt tác cuốn hút biết bao thế hệ người đọc. ĐọcTiếng Gọi \r\nNơi Hoang Dã, bạn đọc sẽ cùng Bấc phiêu lưu tới những miền đất hoang sơ chưa ai biết, hiểu thế nào là lao khổ, tình yêu \r\nthương, sự trung thành và khát vọng tự do…', 90, 57600, '1641897180_tienggoi.png', '2021-12-28 07:36:41'),
(27, '6', 'Trật Tự Chính Trị Và Suy Tàn Chính Trị ', ' Francis Fukuyama', 'Tên Nhà Cung Cấp Alpha Books\r\n\r\nTác giả Francis Fukuyama\r\n\r\nNgười Dịch Bùi Kim Tuyến\r\n\r\nNXB NXB Tri Thức\r\n\r\nNăm XB 2021\r\n\r\nTrọng lượng (gr) 850\r\n\r\nKích Thước Bao Bì 24 x 16 cm\r\nSố trang 808\r\nBộ sách về lý thuyết chính trị được đáng giá cao của nhà kinh tế chính trị người Mỹ Francis Fukuyama gồm có 2 tập:\r\n\r\nTập 1 - Nguồn gốc trật tự chính trị: Từ thời tiền sử đến cách mạng Pháp\r\n\r\nTập 2 - Trật tự chính trị và suy tàn chính trị: Từ cách mạng công nghiệp tới toàn cầu hóa\r\n\r\nBộ sách này ra đời nhằm xem xét nguồn gốc lịch sử của các thể chế chính trị cũng như quá trình suy thoái chính trị. Tập 1 bàn về quá khứ bắt đầu với các nền chính trị của những bậc tổ tiên từ thời Tiền sử, câu chuyện trải dài từ các xã hội bộ lạc đến nhà nước hiện đại đầu tiên ở Trung Hoa, từ sự khởi đầu của pháp quyền ở Ấn Độ và Trung Đông đến quá trình phát triển của trách nhiệm giải trình chính trị tại châu Âu, và kết thúc ở mốc Cách mạng Pháp nổ ra. Tập 2 sẽ đưa câu chuyện đến thời hiện đại, đặc biệt chú ý đến tác động của các thể chế phương Tây đối với các thể chế ở các xã hội ngoài phương Tây khi các xã hội này tìm cách hiện đại hóa. Và sau đó là mô tả cách phát triển chính trị xảy ra trong thế giới đương đại.\r\n\r\nVề tập 2\r\n\r\nTập hai này đặt ra câu hỏi cốt yếu về việc làm thế nào để các xã hội phát triển các thể chế chính trị mạnh mẽ, công tâm và có trách nhiệm giải trình, Fukuyama kể lại câu chuyện từ Cách mạng Pháp đến cái gọi là Mùa xuân Arab và những rối loạn sâu sắc của nền chính trị Mỹ đương đại.\r\n\r\nÔng xem xét tác động của tham nhũng đối với quản trị và tại sao một số xã hội lại có thể thành công trong việc loại bỏ nó. Ông khám phá những di sản khác nhau của chủ nghĩa thực dân ở châu Mỹ Latin, châu Phi và châu Á, đồng thời đưa ra một giải thích rõ ràng về lý do tại sao một số khu vực lại phát triển và phát triển nhanh hơn những khu vực khác. Và ông mạnh dạn tính đến tương lai của nền dân chủ khi đối mặt với tầng lớp trung lưu toàn cầu đang gia tăng và sự tê liệt về chính trị ở phương Tây.\r\n\r\nMột bản tường thuật sâu sắc và tuyệt vời về cuộc đấu tranh để tạo ra một nhà nước hiện đại đang hoạt động tốt, Trật tự chính trị và Suy tàn chính trị xứng đáng là một tác phẩm kinh điển.', 115, 315000, '1640760780_trat-tu-chinh-tri-va-suy-tan-chinh-tri_114720_1.png', '2021-12-28 22:53:50'),
(28, '7', 'Khai Sáng Thời Hiện Đại: Bàn Về Lý trí, Khoa học, Chủ Nghĩa Nhân Văn Và Tiến Bộ ( Bản Đặc Biệt )', 'Steven Pinker', 'NCC: Alpha Books\r\n\r\nTác giả: Steven Pinker\r\n\r\nNgười Dịch: Đào Quốc Minh\r\n\r\nNXB: Thế Giới\r\n\r\nNăm XB: 2021\r\n\r\nKích Thước: 16 x 24\r\n\r\nSố trang: 760\r\n\r\nThế giới có thực sự tan rã? Lý tưởng tiến bộ có lỗi thời không? Trong cuốn sách này, Steven Pinker kêu gọi chúng ta lùi lại những tiêu đề đẫm máu và những lời tiên tri về sự diệt vong, vốn có tác động đến thành kiến ​​tâm lý của chúng ta. Thay vào đó, hãy theo dõi dữ liệu: Với 75 biểu đồ, Pinker cho thấy rằng cuộc sống, sức khỏe, sự thịnh vượng, an toàn, hòa bình, kiến ​​thức và hạnh phúc đang gia tăng, không chỉ ở phương Tây mà còn trên toàn thế giới. Sự tiến bộ này không phải là kết quả của một thế lực vũ trụ nào đó mà là một món quà của Khai sáng: niềm tin rằng lý trí và khoa học có thể nâng cao sự hưng thịnh của con người. Chúng ta nên thay đổi suy nghĩ của mình (nếu có) rằng nhân loại đang đứng bên bờ vực. Mọi người đang sống lâu hơn, khỏe mạnh hơn, tự do hơn và hạnh phúc hơn, và các giải pháp nằm chính ở lý tưởng Khai sáng là sử dụng lý trí và khoa học. Khác xa với một hy vọng ngây thơ, Lý tưởng Khai sáng giờ đây đã phát huy tác dụng. Nhưng hơn bao giờ hết, nó cần một hàng thủ vững chắc. Khai sáng chống lại các dòng chảy của bản chất con người – chủ nghĩa bộ tộc, chủ nghĩa độc tài, ma quỷ hóa, tư duy ma thuật – những thứ mà các nhà ma thuật đều quá sẵn sàng khai thác. Với chiều sâu trí tuệ, cuốn sách lý giải cặn kẽ về lý trí, khoa học và chủ nghĩa nhân văn: những lý tưởng mà chúng ta cần để đối đầu với các vấn đề của mình và tiếp tục tiến bộ.', 40, 499000, '1641894060_kshd.PNG', '2021-12-28 23:09:51'),
(29, '8', 'Season of Storms ', 'Andrzej Sapkowski', 'NXB:HarperCollins\r\n\r\nNgày xuất bản:2011-09-01\r\n\r\nKích thước	129 x 198 x 40 mm\r\n\r\nLoại bìa	Paperback\r\n\r\nSố trang	624\r\n\r\nTrước khi là người bảo vệ Ciri, đứa con của định mệnh, Geralt of Rivia đã là một kiếm sĩ huyền thoại. Tham gia Witcher khi anh ta thực hiện một nhiệm vụ chết người trong cuộc phiêu lưu độc lập này lấy bối cảnh trong thế giới giả tưởng sử thi đột phá của Andrzej Sapkowki, nơi truyền cảm hứng cho chương trình Netflix ăn khách và các trò chơi điện tử bom tấn.\r\n\r\nGeralt of Rivia là một Witcher, một trong số ít người có khả năng săn quái vật săn mồi cho loài người. Anh ta sử dụng các dấu hiệu phép thuật, độc dược và là niềm tự hào của mọi Witcher — hai thanh kiếm, thép và bạc.\r\n\r\nNhưng một hợp đồng đã bị trục trặc, và Geralt thấy mình không có vũ khí đặc trưng của mình. Bây giờ anh ta cần họ trở lại, bởi vì các phù thủy đang âm mưu, và các đám mây trên khắp thế giới đang tụ tập.\r\n\r\nMùa bão sắp đến. . .', 55, 250000, '1641900840_storm.png', '2021-12-28 23:14:43'),
(30, '9', 'Túp Lều Bác Tom ', ' Edmondo De Amicis', 'NXB:Nhà Xuất Bản Văn Học\r\n\r\nKích thước:14.5 x 20.5 cm\r\n\r\nTác giả:Harriet Beecher Stowe\r\n\r\nLoại bìa:Bìa mềm\r\n\r\nSố trang:463\r\n\r\nNgày xuất bản:08-2015\r\n\r\nNước Mỹ mới được thành lập từ cuối thế kỷ XVIII sau khi đánh bại bọn thực dân Anh. Vừa ra đời, nó ra sức phát triển nên công nghiệp với ý đồ đuổi kịp và vượt các nước tư bản châu Âu.\r\n\r\nNgay từ đầu, tư bản Mỹ đã thấm đầy máu và mồ hôi của nhân dân lao động, nhất là của những người nô lệ da đen. Đầu thế kỷ XIX, kinh tế Mỹ phát triển mạnh, công nhân thiếu một cách nghiêm trọng. Để có nhân công, bọn con buôn sang châu Phi buôn những người da đen; lùa từng đoàn người xuống tàu biển chơ sang Mỹ làm nô lệ. biết bao cảnh đàn áp, đánh đập, giết chóc vô cùng tàn nhẫn. Chúng nhốt những người da đen vào cũi dưới hầm tàu, đẩy họ lên đấy Mỹ sống cuộc đời nô lệ. Một số những người nô lệ ấy, phần nhớ quê hương đất nước, gia đình làng mạc, phần bị hành dạ hết sức dã man đã bỏ mình trên đường tới nước Mỹ, và xcas họ bị vứt xuống biển.\r\n\r\nHàng bạn người đã chịu số phận như thế. Những người sống sót bị bán ở các chợ nô lệ nhan nhản trên thị trường Mỹ lúc bấy giờ. Họ bị xiềng xích, đánh đập, vợ lìa chồng, cha bỏ con, cuộc đời đầy tủi nhục, oán hờn. Những người nô lệ bị coi như đồ vật, những \"đồ vật biết nói\" : Không có chút quyền mảy may; chủ nô lệ có đủ mọi quyền hành đối với họ như đối với những đồ vật vô tri vô giác. Chúng tha hồ đánh đập, bán đi mua lại, hoặc giết chết. Đó là một chế độ cực kỳ dã man, một vết nhơ trong lịch sử nước Mỹ. Nhưng ở đâu có áp bức, ở đấy có đấu tranh. Những người nô lệ da đen đã nhiều lần nổi dậy để tự giải phóng; nhưng họ bị đàn áp khốc liệt, những cuộc nổi dậy bị nhấn chìm trong biển máu.', 78, 136000, '1641896880_bactom.png', '2021-12-28 23:18:04'),
(31, '9', 'Thi Khúc & Thi Phẩm', 'Julian-Damazy', 'Ngày xuất bản: 2021-12-13\r\n\r\nLoại bìa: Bìa cứng\r\n\r\nSố trang: 392\r\n\r\nNXB: Nhà Xuất Bản Văn Học\r\n\r\nẤn phẩm đầu tiên trong tủ sách \"Trăm năm Nobel\" là Thi khúc & Thi phẩm - tập thơ đầu tay của nhà thơ Pháp Sully Prudhomme (1839 - 1907), người đầu tiên được trao Giải Nobel Văn học vào năm 1901 “vì những giá trị văn chương xuất sắc, chủ nghĩa lý tưởng cao cả, nghệ thuật hoàn thiện và sự kết hợp tuyệt vời giữa tình cảm và tài năng”. Tên tuổi Sully Prudhomme sớm được biết đến trên thi đàn Việt từ đầu thế kỷ XX, với bản dịch bài thơ “Chiếc bình vỡ” (Le vase brisé) của thi sĩ Đông Hồ đăng trên Nam Phong tạp chí số 124 (tháng 12.1927). Dấu ấn của thơ Sully sau đó cũng có thể tìm thấy trong một vài bài thơ nổi tiếng của các tác giả Thơ Mới, như trường hợp bài “Le vase brisé” đối với “Vết thương lòng” của Lan Sơn và bài “Le Long du Quai” đối với “Những ngày nghỉ học” của Tế Hanh. Tuy nhiên, tính đến nay, vẫn chưa có tập thơ trọn vẹn nào của Sully được dịch và phổ biến ở Việt Nam.', 80, 150000, '1641897900_cakhuc.png', '2022-01-11 17:45:57'),
(32, '8', 'Tất Cả Chỉ Là Ý Nghĩ', 'ALOHA TUẤN', 'Ngày xuất bản: 2020-07-08 \r\n\r\nLoại bìa: Bìa cứng\r\n\r\nSố trang: 1300\r\n\r\nNXB:Nhà Xuất Bản Tổng hợp TP.HCM\r\n\r\nKhi bạn ngồi một mình: Có phải trong Tâm Trí bạn sẽ bắt đầu nghĩ ngợi lung tung. Nó sẽ bắt đầu nghĩ ngợi hết chuyện này đến chuyện nọ: từ công việc, gia đình, sự nghiệp, quá khứ, hiện tại, tương lai Hằng ngày bạn có rất nhiều suy tưởng và tạp niệm không bao giờ yên lặng được. Có phải vậy không?\r\nNXB: Nhà Xuất Bản Tổng hợp TP.HCM', 85, 80000, '1641898320_ynghi.png', '2022-01-11 17:51:21'),
(33, '8', 'Triết học - Khái lược những tư tưởng lớn', 'Ngọc Tuyên', 'Tác giả: DK\r\n\r\nDịch giả: Lê Ngọc Tân\r\n\r\nNăm xuất bản: 2019\r\n\r\nSố trang: 352\r\n\r\nKích thước: 19,3 x 23,5 cm\r\n\r\nVũ trụ khởi đầu như thế nào? Chân lí là gì? Làm thế nào để ta có thể sống một cuộc đời tốt đẹp? Xuyên suốt chiều dài lịch sử, loài người đã tự hỏi mình những điều này cùng những câu hỏi lớn lao khác về bản chất của đời sống và tồn tại – và các tư tưởng gia vĩ đại đã đưa ra những lời giải đáp mà cho đến nay vẫn đang tiếp tục định hình thế giới của chúng ta.', 80, 300000, '1641899460_thoc.PNG', '2022-01-11 18:11:19'),
(34, '7', 'Giáo Trình Lập Trình Android', 'Hoàng Sơn', 'NXB: NXB Xây Dựng\r\n\r\nKích thước:19 x 27 cm\r\n\r\nLoại bìa:Bìa mềm\r\n\r\nSố trang:359\r\n\r\nAndroid là hệ điều hành thu hút nhiều lập trình viên và chiếm một thị phần lớn trong thị trường di động. Do vậy, đi cùng việc phát triển và sử dụng các thiết bị phần cứng một cách hiệu quả thì việc phát triển các ứng dụng phần mềm chạy trên nền Android càng lúc càng tăng cao.\r\n\r\nCuốn sách này giúp bạn đọc nhanh chóng nắm bắt được các thành phần cốt yếu trong Android và có thể lập trình được các ứng dụng cơ bản một cách hiệu quả. Đây cũng sẽ là cuốn giáo trình hữu ích cho sinh viên các trường đại học kỹ thuật chuyên về công nghệ thông tin. ', 80, 58000, '1641901920_and.png', '2022-01-11 18:52:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `book_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `customer_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `book_id`, `qty`, `price`, `customer_id`) VALUES
(9, 3, 2, 3000000000, 1),
(55, 28, 1, 499000, 4),
(56, 19, 1, 73000, 4),
(57, 11, 3, 118750, 4),
(62, 15, 2, 125000, 2),
(63, 12, 1, 261300, 2),
(64, 28, 1, 499000, 2),
(65, 13, 1, 84000, 2),
(66, 21, 4, 51850, 2),
(67, 17, 5, 155000, 2),
(68, 27, 3, 315000, 2),
(174, 5, 5, 73000, 5),
(190, 19, 1, 73000, 1),
(199, 20, 5, 156000, 9),
(200, 19, 2, 73000, 9),
(201, 20, 4, 156000, 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(6, 'Chính trị - pháp luật', 'Môi trường chính trị và luật pháp tạo nên một khung khác biệt trong môi trường và điều kiện kinh doanh ở mỗi quốc gia. \r\nMôi trường chính trị- luật pháp bao gồm thể chế chính trị, sự ổn định của chính phủ...Hay hệ thống các văn bản pháp quy,\r\n chính sách, các đạo luật, bộ luật và các quy định, hướng dẫn thi hành của từng quốc gia'),
(7, 'Khoa học công nghệ', 'Khoa học Khoa học là nền tảng, là động lực thúc đẩy sự phát triển, là chìa khóa mở cánh cửa tương lai của loài người. \r\nSách khoa học là những ghi chép của các nhà nghiên cứu về rất nhiều lĩnh vực như: thiên văn học, vũ trụ học, di truyền \r\nhọc,...'),
(8, 'Sách truyện - tiểu thuyết', 'Tiểu thuyết là một thể loại văn xuôi có hư cấu, thông qua nhân vật, hoàn cảnh, sự việc để phản ánh bức tranh xã hội \r\nrộng lớn và những vấn đề của cuộc sống con người, biểu hiện tính chất tường thuật, tính chất kể chuyện bằng ngôn ngữ \r\nvăn xuôi theo những chủ đề xác định. '),
(9, 'văn học nghệ thuật', 'Văn học - nghệ thuật là loại hình sáng tác đặc biệt tái hiện lại những bình diện của cuộc sống, của xã hội và con người \r\ndưới ngòi bút trào phúng và văn hoa. Thông thường, phương thức sáng tạo nên những tác phẩm văn học, đặc biệt là những \r\ntác phẩm văn học kinh điển sẽ thông qua một phần hư cấu nhất định cùng phong cách ngôn ngữ do chính tác giả lựa chọn. ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`, `contact`, `email`, `password`, `date_created`) VALUES
(5, 'Phuc Hoang', '198 Ấp Lễ Trang, xã Vĩnh Hòa, huyện Phú Giáo, tỉnh Bình Dương', '0971126942', 'hoangbaophuc369@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-01-01 22:30:36'),
(6, 'Nguyễn Văn A', '198 Ấp Lễ Trang', '0971126942', 'abc@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-01-01 22:45:29'),
(7, 'Hoàng Bảo Phúc', '143 Lã Xuân Oai, quận Thủ Đức, thành phố HCM', '0971126942', 'hoangbaophuc33@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-01-03 05:18:25'),
(8, 'Hoàng Bảo Phúc', '198 Ấp Lễ Trang', '0971126942', 'hoangbaophuc123@gmail.com', '25f9e794323b453885f5181f1b624d0b', '2022-01-07 22:07:03'),
(9, 'Hoàng Bảo Phúc', '198 Ấp Lễ Trang', '0971126942', 'hoangbaophuc333@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2022-01-11 05:00:29'),
(10, 'Bảo Phúc', '198 Ấp Lễ Trang', '0971126942', 'hoangbaophuc336@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '2022-01-11 06:46:08'),
(11, 'Hoàng Bảo Phúc', '198', '0971126942', 'hoangbaophuc789@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2022-01-12 03:21:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `address` text NOT NULL,
  `total_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `address`, `total_amount`, `status`, `date_created`) VALUES
(13, 5, '198 Ấp Lễ Trang, xã Vĩnh Hòa, huyện Phú Giáo, tỉnh Bình Dương', 0, 1, '2022-01-01 22:31:17'),
(14, 6, '198 Ấp Lễ Trang', 0, 0, '2022-01-01 22:46:15'),
(15, 5, '198 Ấp Lễ Trang, xã Vĩnh Hòa, huyện Phú Giáo, tỉnh Bình Dương', 0, 1, '2022-01-02 06:41:25'),
(18, 7, '198 Ấp Lễ Trang', 0, 1, '2022-01-03 05:18:37'),
(19, 5, '198 Ấp Lễ Trang, xã Vĩnh Hòa, huyện Phú Giáo, tỉnh Bình Dương', 0, 0, '2022-01-03 23:11:30'),
(20, 7, '198 Ấp Lễ Trang', 0, 1, '2022-01-06 09:31:51'),
(21, 8, '198 Ấp Lễ Trang', 0, 0, '2022-01-07 22:09:23'),
(22, 7, '198 Ấp Lễ Trang', 0, 1, '2022-01-08 08:06:33'),
(23, 9, '198 Ấp Lễ Trang', 0, 0, '2022-01-11 05:50:07'),
(24, 9, '198 Ấp Lễ Trang', 0, 0, '2022-01-11 05:51:24'),
(25, 9, '198 Ấp Lễ Trang', 0, 0, '2022-01-11 06:51:30'),
(26, 9, '198 Ấp Lễ Trang', 0, 0, '2022-01-11 10:42:31'),
(27, 9, '198 Ấp Lễ Trang', 0, 0, '2022-01-11 12:06:26'),
(28, 9, '198 Ấp Lễ Trang', 0, 0, '2022-01-11 21:40:04'),
(29, 9, '198 Ấp Lễ Trang', 0, 0, '2022-01-11 21:46:01'),
(30, 9, '198 Ấp Lễ Trang', 0, 0, '2022-01-11 23:09:21'),
(31, 9, '198 Ấp Lễ Trang', 0, 0, '2022-01-11 23:12:02'),
(32, 9, '198 Ấp Lễ Trang', 0, 0, '2022-01-11 23:15:45'),
(33, 9, '198 Ấp Lễ Trang', 0, 0, '2022-01-11 23:21:05'),
(34, 9, '198 Ấp Lễ Trang', 0, 0, '2022-01-11 23:24:01'),
(35, 9, '198 Ấp Lễ Trang', 0, 0, '2022-01-12 00:01:26'),
(36, 9, '198 Ấp Lễ Trang', 0, 0, '2022-01-12 00:01:39'),
(37, 9, '198 Ấp Lễ Trang', 0, 0, '2022-01-12 01:26:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `book_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `book_id`, `qty`, `price`) VALUES
(5, 5, 1, 2, 2500),
(7, 7, 3, 3, 3000000000),
(8, 8, 10, 6, 200000),
(9, 8, 8, 3, 518000),
(10, 8, 9, 1, 250000),
(11, 8, 1, 1, 2500),
(12, 9, 2, 1, 1800),
(13, 9, 4, 3, 3000000000),
(14, 9, 11, 1, 118750),
(15, 9, 12, 2, 261300),
(16, 9, 21, 2, 51850),
(17, 9, 14, 2, 76300),
(18, 9, 25, 2, 107000),
(19, 9, 22, 2, 139000),
(20, 10, 2, 2, 1800),
(21, 10, 1, 2, 2500),
(22, 10, 11, 1, 200000),
(23, 10, 14, 2, 76300),
(24, 10, 26, 4, 57600),
(25, 11, 12, 15, 261300),
(26, 11, 19, 1, 73000),
(27, 11, 15, 3, 125000),
(28, 11, 14, 3, 76300),
(29, 11, 11, 4, 118750),
(30, 12, 23, 1, 135000),
(31, 12, 21, 3, 51850),
(32, 12, 22, 3, 139000),
(33, 12, 24, 3, 53000),
(34, 13, 21, 1, 51850),
(35, 13, 17, 1, 155000),
(36, 13, 14, 2, 76300),
(37, 14, 29, 3, 250000),
(38, 14, 28, 5, 499000),
(39, 14, 14, 2, 76300),
(40, 15, 12, 1, 261300),
(41, 15, 22, 4, 139000),
(42, 15, 14, 2, 76300),
(45, 18, 21, 1, 51850),
(46, 18, 13, 1, 84000),
(47, 19, 19, 1, 73000),
(48, 19, 20, 3, 156000),
(49, 20, 12, 3, 261300),
(50, 21, 19, 1, 73000),
(51, 22, 20, 2, 156000),
(52, 22, 21, 1, 51850),
(53, 23, 19, 3, 73000),
(54, 23, 20, 2, 156000),
(55, 24, 19, 2, 73000),
(56, 25, 30, 1, 136000),
(57, 26, 19, 1, 73000),
(58, 27, 19, 1, 73000),
(59, 27, 20, 1, 156000),
(60, 28, 22, 2, 139000),
(61, 29, 19, 1, 73000),
(62, 30, 19, 2, 73000),
(63, 31, 20, 1, 156000),
(64, 32, 20, 2, 156000),
(65, 32, 19, 3, 73000),
(66, 33, 20, 3, 156000),
(67, 34, 21, 1, 51850),
(68, 35, 21, 1, 51850),
(69, 36, 22, 1, 139000),
(70, 37, 19, 1, 73000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'EBooks', 'hoangbaophuc369@gmail.com', '0971126942', '', '&lt;p style=&amp;#x2019;&rsquo;margin-top:0in;margin-right:0in;margin-bottom:0in;margin-left:0in;line-height:normal;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;text-align:justify;background:white;&amp;#x2019;&gt;&lt;span style=&quot;font-size:19px;color:#212529;&quot;&gt;Ebook l&amp;agrave; một website cung cấp c&amp;aacute;c cuốn s&amp;aacute;ch hay v&amp;agrave; chất lượng . Tất cả những cuốn s&amp;aacute;ch được trang web lựa chọn từ những thể loại kh&amp;aacute;c nhau như : ch&amp;iacute;nh trị , khoa hoc , tiểu thuyết , văn học ,vv... tất cả c&amp;aacute;c cuốn s&amp;aacute;ch hay được Ebook chọn lọc chi tiết v&amp;agrave; chất lượng đem đến cho độc giả của m&amp;igrave;nh , website Ebook &amp;nbsp;kh&amp;ocirc;ng những để gi&amp;uacute;p độc giả b&amp;agrave;n luận v&amp;agrave; đ&amp;aacute;nh gi&amp;aacute; về cuốn s&amp;aacute;ch , m&amp;agrave; c&amp;ograve;n l&amp;agrave; thư viện quen thuộc lan tỏa niềm đam m&amp;ecirc; đọc s&amp;aacute;ch đến với cộng đồng v&amp;agrave; x&amp;atilde; hội .&lt;/span&gt;&lt;/p&gt;&lt;p style=&amp;#x2019;&rsquo;margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;&amp;#x2019;&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://localhost/book_store/admin/assets/uploads/1604629260_books-1419613.jpg&quot; style=&quot;width: 465px;&quot; class=&quot;fr-fic fr-dib&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', '0192023a7bbd73250516f069df18b500', 1),
(2, 'D2D', 'abc', '900150983cd24fb0d6963f7d28e17f72', 2),
(3, 'Hoàng Bảo Phúc', 'sayhellotomyfriend', '202cb962ac59075b964b07152d234b70', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `books`
--
ALTER TABLE `books`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT cho bảng `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
