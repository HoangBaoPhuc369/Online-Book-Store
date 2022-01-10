-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 10, 2022 lúc 04:56 AM
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
(3, '5', 'Bàn Về Khế Ước Xã Hội', 'Nhà Xuất Bản Thế Giới', 'Khế ước xã hội là tên gọi vắn tắt của bản luận văn lớn mà J. J. Rousseau đặt dưới một nhan đề khá dài: \r\nBàn về khế ước xã hội hay là các nguyên tắc của quyền chính trị (Du Contrat social – ou principes du droit \r\npolitique).\r\n \r\nVề lai lịch cuốn sách, tác giả viết: “Luận văn nhỏ này trích từ một công trình nghiên cứu rộng lớn mà trước \r\nkia tôi đã viết, nhưng vì chưa lượng được sức mình nên phải bỏ đi từ lâu”.\r\n\r\nNhững tư tưởng của Khế ước xã hội đã lay động bao lớp người không thỏa hiệp với chế độ quân chủ chuyên chế \r\nthời ấy; và khi cuộc Cách mạng Pháp kết thúc năm 1794, Hội nghị Quốc ước đã quyết định đưa hình tượng và tro \r\nhài của Jean-Jacques Rousseau vào Điện Panthéon, nơi chôn cất và lưu niệm các bậc vĩ nhân đã làm vẻ vang cho \r\nnước Pháp.\r\n\r\nTrên 200 năm đã trôi qua, kể từ ngày Khế ước xã hội ra đời mà luồng sáng do tác phẩm rọi ra vẫn còn ánh lên \r\ntrước mắt chúng ta ngày nay.', 100, 35000, '1641717840_sach-ban-ve-khe-uoc-xa-hoi.png', '2022-01-09 15:40:54'),
(4, '5', 'Chính Trị - Khái Lược Những Tư Tưởng Lớn', 'Công Ty Cổ Phần Văn Hóa Đông A', 'Có đúng chăng khi chúng ta lật đổ một nhà cai trị bất công? Liệu nền dân chủ có thực sự là hình thức chính \r\nquyền tốt nhất? Và chiến tranh có thể được biện minh hay không? Xuyên suốt chiều dài lịch sử, loài người đã \r\ntự hỏi mình những điều này cùng những câu hỏi lớn lao khác về cách thức tốt nhất để chúng ta cai trị chính \r\nmình và các tư tưởng gia vĩ đại đã đưa ra những lời giải đáp mà cho đến nay vẫn đang tiếp tục định hình thế \r\ngiới.\r\n\r\nVới văn phong dễ hiểu và sáng sủa, Chính trị - Khái Lược Những Tư Tưởng Lớn là tập hợp những bài viết ngắn \r\ngọn hàm súc giải thích rõ những điều khó hiểu, những sơ đồ từng bước giúp làm sáng tỏ những lí thuyết rối \r\nrắm và những hình ảnh minh họa dí dỏm giúp chúng ta ý thức rõ hơn về vai trò của mình trong cách thức tổ \r\nchức xã hội.\r\n\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức \r\nvà địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, \r\nthuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 50, 35000, '1641717900_sach-chinh-tri-khai-luoc-nhung-tu-tuong.png', '2022-01-09 15:45:01'),
(5, '5', 'Qatar - Đất Nước Nhỏ, Nền Chính Trị Lớn', 'NXB Trẻ', 'Nhà nước vùng Vịnh Qatar có số dân chưa tới 2 triệu, gần như không có nguồn nước tự nhiên và mới chỉ \r\ngiành được độc lập từ năm 1971. Nhưng nguồn dầu mỏ và khí đốt khổng lồ đã tạo điều kiện cho gia tộc al \r\nThani cầm quyền ở đất nước này tạo được ảnh hưởng vô cùng lớn trong chính trị khu vực và quốc tế. Như Mehran \r\nKamrava giải thích trong cuốn sách chi tiết và nhiều thông tin này, Qatar là một “người khổng lồ tí hon”: dù \r\nthiếu hầu hết các phương tiện của quyền lực nhà nước nhưng Qatar đã tự tạo cho mình quyền lực vô cùng lớn về \r\nphương diện kinh tế, văn hóa cũng như ngoại giao.\r\n\r\nKarava mô tả Qatar như một đất nước thử nghiệm đang xây dựng một xã hội mới trong khi thực hành cái mà tác \r\ngiả gọi là “quyền lực tinh tế.” Qatar là nơi đặt tổng hành dinh của hãng truyền thông toàn cầu Al Jazeera, \r\nlà nơi trình diễn tài năng của các kiến trúc sư nổi tiếng thế giới, các trường đại học trứ danh của nước Mỹ \r\nnhư Harvard, Yale, Georgetown cũng đặt cơ sở ở đây. Qatar còn là nước đăng cai Fifa World Cup 2022. Kamrava \r\nlập luận rằng việc Qatar sử dụng hiệu quả quyền lực tinh tế thách thức hiểu biết của chúng ta về vai trò của \r\ncác nước nhỏ trong hệ thống toàn cầu. Cuốn sách này là khảo cứu sâu sắc và kịp thời về xã hội và chính trị \r\nQatar đương đại.\r\n\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và \r\nđịa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế \r\nnhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng)', 75, 38000, '1641718200_sach-qatar-dat-nuoc-nho-nen-chinh-tri-lon.png', '2022-01-09 15:45:41'),
(6, '5', ' Quân Vương – Thuật Cai Trị ', 'Nhà Xuất Bản Thế Giới', 'Quân Vương – Thuật Cai Trị (Tái Bản 2018) là cuốn sách gối đầu giường của rất nhiều thế hệ chính trị gia và \r\nlãnh đạo trên thế giới.\r\n\r\nCuốn sách nhỏ của Niccolò Machiavelli đã hội tự những nguyên tắc làm nền móng cho khoa học quản trị nói \r\nchung và chính trị học nói riêng.\r\n\r\nNgười ta sẽ luôn đọc Quân vương chừng nào con người vẫn chưa thôi trò chơi nguy hiểm nhưng hấp dẫn có cái \r\ntên \"chính trị\".\r\n\r\nQua cuốn sách, độc giả sẽ tìm ra chân dung một vị quân vương hình mẫu : keo kiệt hay rộng lượng, độc ác hay \r\nnhân từ, thất hứa hay giữ lời nếu lời hứa đi ngược lại lợi ích của mình, phải làm gì để tránh bị dân chúng \r\ncăm ghét, phải thực thi những hành động lớn lao để nâng cao uy tín của mình.\r\n\r\nCuốn sách bàn về khoa học chính trị của nhà ngoại giao, nhà triết học và nhà quân sự người Ý – \r\nNiccolò Machiavelli. Xuất hiện lần đầu tiên vào năm 1513 nhưng mãi đến năm 1532, ấn bản đầu tiên mới được \r\nchính thức xuất bản dưới sự cho phép của Giáo hoàng Clement VII.\r\n', 100, 36000, '1641717960_sach-quan-vuong-thuat-cai-tri.png', '2022-01-09 15:46:51'),
(7, '6', 'Chính Xác - Nguyên Lý, Thực Thi Và Giải Pháp Cho Internet Vạn Vật', ' Nxb Bách khoa Hà Nội', 'Chính Xác (Precision) là một bản trình bày phản ánh đúng những thách thức phức tạp phải đối mặt của các \r\nchuyên gia dữ liệu, nhà công nghệ và doanh nhân - những người đang phải giải quyết một số thách thức vận \r\nhành lớn nhất thế giới thông qua Internet Vạn vật (Internet of Things - IoT), dữ liệu lớn và học máy. Nếu \r\nbạn muốn đi xa hơn sự cường điệu và thực sự hiểu những gì Internet Vạn vật (IoT) của ngày nay, những gì nó \r\ncó thể trở thành của ngày mai, và làm thế nào để đạt được giá trị của nó thì cuốn Chính Xác phải nằm trong \r\ntủ sách của bạn.\r\n\r\nCó thể bạn không chắc tại sao máy pha cà phê lại cần phải nói chuyện với lò nướng, nhưng công nghệ chính xác \r\nđang làm cho Internet Vạn vật (IoT) có thể thay đổi hành tinh này. Giúp làm sáng tỏ, Tiến sĩ Timothy Chou đã \r\nviết ra quyển Chính Xác (Precision) để giới thiệu cho chúng ta những điều cơ bản về Internet Vạn vật (IoT) \r\ncủa doanh nghiệp.', 100, 40000, '1641718020_chính-xác-nguyên-lý-thực-thi-và-giải-pháp.png', '2022-01-09 15:47:43'),
(8, '6', 'Điều Khiển Chất Lượng Dịch Vụ Viễn Thông ', 'Nxb Thông tin & truyền thông', 'Trong ít năm gần đây, ở nước ta đã và đang chứng kiến một sự bùng nổ của các nhu cầu Internet; sự phát triển \r\nvượt bậc và đa dạng của các công nghệ số tương ứng trong mạng...Tuy nhiên, những thành công của viễn thông \r\ntrong việc hỗ trợ các dịch vụ Internet ngày càng đa dạng không chỉ phụ thuộc rất mạnh vào hạ tầng truyền dẫn \r\nmà còn bị chi phối rất lớn bởi độ tin cậy của hệ thống điều khiển chất lượng dịch vụ (QoS) nằm ẩn sau nền \r\nphần cứng thấy được. Mặc dầu vậy những hiểu biết về nó hiện nay ở ta còn chưa thật tương xứng do đây là lĩnh \r\nvực kỹ thuật mới, tài liệu đã thiếu lại rất tản mạn; mặt khác, rất ít trường đào tạo công nghệ ở nước ta \r\nhiện nay có giáo trình hoặc đào tạo môn học này. Trong bối cảnh như vậy, bộ sách \"Điều Khiển Chất Lượng Dịch \r\nvụ Viễn Thông - Công Nghệ Và Bí Quyết Triển Khai\"- là kết quả của quá trình lâu dài hàng chục năm nghiên cứu,\r\n giảng dạy và tham gia các dự án phát triển trong ngành viễn thông của tác giả Trần Quang Huy - ra đời chắc \r\nchắn sẽ là một sự đột phá bổ ích .', 100, 42000, '1641718080_điều-khiển-chất-lượng-dịch-vụ-viễn-thông_1.png', '2022-01-09 15:48:25'),
(9, '6', ' Kỹ Thuật Audio Và Video ', 'NXB Hồng Đức', 'Kỹ thuật Audio và Video gồm hai phần: Audio - Video tương tự và Audio - Video số.\r\n\r\nKỹ thuật Audio và Video gồm hai quyển có nội dung theo hai phần như trên. Mức độ lý luận có sự chọn lọc \r\nnhững kiến thức không quá sâu, nhằm phục vụ cho việc giảng dạy ở nhiều bậc đào tạo khác nhau, đồng thời là \r\ntài liệu tham khảo cho các đối tượng muốn tìm hiểu về kỹ thuật viên, công nhân lành nghề. Một số kiến thức\r\n mới hiện đại được đưa vào giáo trình để độc giả có dịp cập nhật kiến thức theo sự phát triển nhanh của \r\nngành điện tử.\r\n', 100, 41000, '1641718140_kỹ-thuật-audio-và-video.png', '2022-01-09 15:49:08'),
(10, '6', 'Mặt Trái Của Công Nghệ', ' NXB Chính Trị Quốc Gia', 'Kỹ thuật, công nghệ đóng vai trò quan trọng, tạo nên những bước phát triển đột phá của xã hội loài người, \r\ntừ hàng nghìn năm trước đây cũng như trong bối cảnh Cách mạng công nghiệp lần thứ tư hiện nay. Những phát \r\nminh của con người từ viên đá lửa cho đến các công cụ bằng kim loại, động cơ hơi nước, năng lượng điện, \r\nbóng bán dẫn cho đến máy tính điện tử, mạng Internet, trí tuệ nhân tạo,... là nền móng, trụ cột cho sự phát \r\ntriển của tất cả các ngành và lĩnh vực. Nhờ có tiến bộ khoa học - công nghệ mà năng suất lao động tăng nhanh,\r\n người dân ở nhiều quốc gia trở nên giàu có, sung túc, khỏe mạnh và sống lâu hơn. Tuy nhiên, các phát minh, \r\nsáng chế có thể có những tác động phụ, tiêu cực đến đời sống con người cũng như môi trường sinh thái tự nhiên.', 100, 39000, '1641718140_mặt-trái-của-công-nghệ.png', '2022-01-09 15:49:57'),
(11, '7', ' NXB Chính Trị Quốc Gia', 'Nhà Xuất Bản Hồng Đức', '\r\nNếu coi tiểu thuyết 5 CENTIMET TRÊN GI Y là một bức tranh ghép hình, khắc họa chuyện đời, chuyện tình của \r\nTono Takaki, thì 5 CENTIMET TRÊN GI Y ONE MORE SIDE giống như phần mở rộng và hoàn thiện của bức tranh ấy.\r\n\r\nNhững mảnh ghép vốn có được thay mới cả về nội dung và cách thể hiện. Những mảnh ghép ẩn được hé lộ đầy đủ \r\nvà sáng tỏ. Bức tranh tổng thể vì thế mà toàn vẹn hơn, đa chiều hơn.\r\n\r\nĐược chắp bút bởi tác giả quen thuộc Kanoh Arata, 5 CENTIMET TRÊN GIÂY - ONE MORE SIDE sẽ đưa độc giả tiếp \r\ncận câu chuyện đượm buồn nhưng tuyệt đẹp của Shinkai Makoto một lần nữa, qua “một góc nhìn khác”.', 100, 36000, '1641718260_5-centimet-tren-giay-one-more-side.png', '2022-01-09 15:51:18'),
(12, '7', 'Heidi ', 'Nhà Xuất Bản Văn Học', '\r\nNội dung tác phẩm: Vì vội vã đi kiếm việc làm mới, người dì ích kỉ đã gửi Heidi đến cho ông nội của cô bé, \r\nđang sống cô độc trên vùng núi Alm. Ai cũng ái ngại cho Heidi khi phải sống với ông già lập dị và cục cằn ấy. Nhưng ai ngờ được rằng, Heidi bé bỏng với tấm lòng nhân hậu tự nhiên, chẳng những giúp ông nội tìm lại lòng yêu cuộc sống, mà còn mang đến bao đổi thay kì diệu. Những ai từng gặp Heidi, dù ở Dörfli hay Frankfurt, đều muốn cô bé mãi mãi ở bên mình. Nhưng tất cả đều hiểu, chỉ ở giữa cánh đồng hoa rực rỡ, thung lũng mênh mông và ráng chiều rực đỏ trên những ngọn núi thanh tĩnh ngàn đời của dãy Alm, Heidi mới thực sự hạnh phúc để tặng niềm vui cho mọi người.\r\n\r\nRa đời cách đây 140 năm, Heidi của nữ nhà văn Johanna Spyri được coi là một tác phẩm kinh điển dành cho thiếu\r\n nhi. Với văn phong giản dị, trong sáng, tác phẩm này đem đến cho người đọc những bức tranh thiên nhiên thơ \r\nmộng, hùng vĩ của đất nước Thụy Sĩ, cùng những điều bí ẩn của tạo vật và tâm hồn con trẻ. Heidi đã nhiều lần \r\nđược chuyển thể thành phim điện ảnh, phim truyền hình, kịch bản sân khấu và anime.\r\n\r\nCuốn sách kinh điển của Johanna Spyri đã được Đông A xuất bản với bản dịch được yêu thích của dịch giả Thanh \r\nVân, minh họa của Elena Selivanova. Sách in màu, bìa cứng, có bìa áo.', 100, 34000, '1641718260_Heidi.png', '2022-01-09 15:51:58'),
(13, '7', 'Những Người Đàn Bà', 'Nhà Xuất Bản Thế Giới', 'NHỮNG NGƯỜI ĐÀN BÀ là câu chuyện đầy đau đớn, dữ dội về số phận của những người phụ nữ yếm thế trong xã hội \r\nPalestine. Họ không có tiếng nói ngay trong gia đình mình, lấy chồng theo sự sắp đặt của cha mẹ và chỉ quẩn \r\nquanh bên căn bếp, chăm lo con cái.\r\n\r\nXuyên suốt câu chuyện là sự câm lặng của ba thế hệ phụ nữ. Thế hệ đầu thoát khỏi sự chiếm đóng của Israel \r\ntrong xung đột Palestine và Israel, chạy trốn đến nước Mỹ với mong muốn tránh khỏi cuộc sống ở trại tị nạn. \r\nThế hệ thứ 2 đồng ý một cuộc hôn nhân sắp đặt với người Mỹ gốc Palestine với hi vọng đất Mỹ tự do thì tiếng \r\nnói của nữ giới sẽ được tôn trọng hơn trên đất Palestine. Thế hệ thứ 3, suýt nữa thì rơi vào bánh xe đổ của \r\ncác thế hệ trước, nếu cô ấy không phát hiện ra bí mật kinh khủng của gia đình mình và số phận của người mẹ \r\nđáng thươ Mỗi thế hệ đều có giấc mơ và khát vọng về sự tự do và nữ quyền, nhưng không phải ai cũng có thể \r\nđấu tranh đến tận cùng.\r\n\r\nLấy bối cảnh ở một nước Mỹ đầy khát khao cùng những lời hứa hẹn rộng mở, để kể một nền văn hóa với hủ tục cực\r\nđoan, khép kín và kiểm soát đối người phụ nữ, NHỮNG NGƯỜI ĐÀN BÀ là một cái nhìn sâu sắc về sự tuyệt vọng, \r\nthống khổ của phụ nữ gốc Palestine. Dù vậy, ẩn chứa bên trong họ là sức mạnh phi thường, lòng dũng cảm để tìm\r\nlại tiếng nói và phẩm giá của mình.', 100, 37000, '1641718380_nhung-nguoi-dan-ba.png', '2022-01-09 15:52:38'),
(14, '10', 'Hai số phận  - Jeffrey Archer', 'Hồng Đức', '\r\nHai Số Phận (có tên gốc tiếng Anh là: Kane and Abel) là một cuốn tiểu thuyết kinh điển được sáng tác vào năm 1979 bởi \r\nnhà văn người Anh Jeffrey Archer.\r\n\r\nCuốn sách là một câu chuyện kể về hai người có số phận khác nhau. Họ không có điểm gì giống nhau cả, ngoại trừ việc họ \r\nsinh ra vào cùng một thời điểm (18/04/1906) và có một lòng quyết tâm để đạt được thành công trong cuộc sống. William Kane\r\n là một người mạnh mẽ và giàu có trong khi đó Abel Rosnovski (tên ban đầu là Wladek Koskiewicz) là một người gốc Ba Lan \r\nphải đấu tranh từ lúc sinh ra và lớn lên cùng với những người nghèo khổ, cuối cùng di cư đến Hoa Kỳ. ', 100, 38000, '1641718380_hai-so-phan.png', '2022-01-09 15:53:38'),
(15, '10', 'Nanh trắng', 'Hội Nhà Văn', 'Cuối thế kỷ XIX tại Canada, con người đổ xô đi tìm vàng tại những vùng lạnh giá phương bắc. Được thừa hưởng tất cả những \r\ngì tinh túy nhất của sói bố Một mắt và mẹ Kiche, Nanh Trắng sinh ra như để trở thành một chiến binh sói đơn độc với bản \r\nnăng sinh tồn dẻo dai đến kì lạ trong môi trường khắc nghiệt ấy.\r\n\r\nSau lần mẹ Kiche bất ngờ gặp lại những chủ cũ, Nanh Trắng bước chân vào thế giới con người. Từ đấy, cuộc sống của Nanh \r\nTrắng gắn liền vào những cuộc rượt đuổi, cắn xé nhau giữa những kẻ cùng dòng giống, những cú đạnh chí mạng khi lỡ phạm \r\nsai lầm, nhưng cơn đói triền miên tưởng có thể lìa đời, sự tù đày giam cầm tàn bạo. Thế nhưng, khi sự sống tưởng như đã \r\ntuyệt vọng, Nanh Trắng lại gặp được Weedon Scott, một con người nhân hậu. Kể từ đó, Nanh Trắng mới biết về lòng tin và \r\nlòng yêu thương...', 100, 37000, '1641718440_nanh-trang.png', '2022-01-09 15:54:54'),
(16, '10', 'Ruồi trâu', 'NXB Văn Học', 'Ruồi trâu là một tác phẩm rất đáng đọc. Câu chuyện diễn ra vào thế kỉ 19 tại Ý. Thời đó, đất nước này đang bị chia cắt. \r\nDưới quyền kiểm soát của đế quốc Áo, các phong trào cách mạng nhằm thống nhất nước Ý đều bị đàn áp. Một thanh niên Ý kiên\r\ncường đã dành cả cuộc đời mình để đấu tranh cho lí tưởng giải phóng đất nước.\r\n\r\nCuộc đời anh chứa đựng những bí mật khiến anh bị giằng xé giữa tình yêu và nỗi tức giận, chịu đựng những nỗi đau cả về \r\nthể xác và tinh thần. Nhưng vượt lên tất cả anh đã luôn tiến về phía trước. Anh đã sống với ý chí và nghị lực đáng khâm \r\nphục.\r\n\r\nRuồi trâu gửi tới người đọc một thông điệp: Cuộc sống dù ngắn ngủi nhưng vẫn có ý nghĩa khi ta sống có lí tưởng.', 100, 40000, '1641718560_ruoi-trau.png', '2022-01-09 15:56:15'),
(17, '10', ' tiếng gọi nơi hoang dã', ' Hội Nhà Văn', 'Tiếng Gọi Nơi Hoang Dã (nguyên bản tiếng Anh: The Call of the Wild) là tiểu thuyết của nhà văn Mỹ Jack London. Chuyện kể \r\nvề những chuyến phiêu lưu mạo hiểm của chú chó Bấc trung thành. Bấc đang sống trong trang trại của một gia đình giàu có \r\nthì bị bắt cóc, trở thành chó kéo xe cho những người đi tìm vàng ở khu Alaska lạnh giá. Bấc phải học cách đối diện với \r\ncuộc đấu tranh sinh tồn và trở thành thủ lĩnh của đàn chó. Thiên nhiên nguyên thủy đã đánh thức bản năng của Bấc.\r\n\r\nSau một lần đi săn trở về, Bấc nhìn thấy cái chết thương tâm của Thoóctơn - người chủ nó thương yêu nhất. Tình yêu thương,\r\n sự trung thành mà Bấc dành cho Thoóctơn trở thành nỗi đau thống thiết, Bấc trở nên hoang dã hơn bao giờ hết… Không còn \r\nmối liên hệ nào níu Bấc lại với con người, nó bị cuốn theo tiếng gọi nơi hoang dã, cuối cùng trở thành một con sói hoang.\r\n\r\nXuất bản lần đầu năm 1903, Tiếng Gọi Nơi Hoang Dã đã trở thành kiệt tác cuốn hút biết bao thế hệ người đọc. ĐọcTiếng Gọi \r\nNơi Hoang Dã, bạn đọc sẽ cùng Bấc phiêu lưu tới những miền đất hoang sơ chưa ai biết, hiểu thế nào là lao khổ, tình yêu \r\nthương, sự trung thành và khát vọng tự do…\r\n', 100, 39000, '1641718620_tieng-goi-noi-hoang-gia.png', '2022-01-09 15:57:03');

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
(5, 'chính trị - pháp luật', 'chính trị - pháp luật'),
(6, 'Khoa học công nghệ', 'Khoa học công nghệ'),
(7, 'Sách truyện - tiểu thuyết', 'Sách truyện - tiểu thuyết'),
(8, 'tâm linh - tôn giáo', 'tâm linh - tôn giáo'),
(9, 'Văn hóa - xã hội', 'Văn hóa - xã hội'),
(10, 'văn học nghệ thuật', 'văn học nghệ thuật');

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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `about_content`) VALUES
(1, 'EBooks', 'khanh@sample.com', '0909126547', '&lt;p&gt;&lt;strong&gt;EBOOKS - &amp;nbsp;TH&amp;Ecirc;́ GIỚI H&amp;Ocirc;̣I TỤ KI&amp;Ecirc;́N THỨC&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Cửa h&amp;agrave;ng s&amp;aacute;ch EbookS cung cấp dịch vụ mua s&amp;aacute;ch trực ti&amp;ecirc;́p và trực tuy&amp;ecirc;́n cho kh&amp;aacute;ch h&amp;agrave;ng. Với sự đảm bảo của EbookS, bạn sẽ mua sách trực tuyến an t&amp;acirc;m v&amp;agrave; nhanh ch&amp;oacute;ng hơn bao giờ hết!&amp;nbsp;&lt;/p&gt;&lt;h2&gt;&lt;strong&gt;MUA SẮM CÁC SẢN PH&amp;Acirc;̉M SÁCH ONLINE ĐƠN GIẢN, NHANH CH&amp;Oacute;NG V&amp;Agrave; AN TO&amp;Agrave;N&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;Nếu bạn đang t&amp;igrave;m kiếm một trang web để mua những cu&amp;ocirc;́n sách trực tuyến th&amp;igrave;&amp;nbsp;EbookS&amp;nbsp;l&amp;agrave; một sự lựa chọn tuyệt vời d&amp;agrave;nh cho bạn. Bản chất của&amp;nbsp;EbookS&amp;nbsp;l&amp;agrave; một social E-commerce platform - nền tảng trang web thương mại điện tử chuy&amp;ecirc;n cung c&amp;acirc;́p các dịch vụ bán sách dành cho mọi đ&amp;ocirc;́i tượng khách hàng. Điều n&amp;agrave;y cho ph&amp;eacute;p người mua v&amp;agrave; người b&amp;aacute;n h&amp;agrave;ng dễ d&amp;agrave;ng tương t&amp;aacute;c, trao đổi th&amp;ocirc;ng tin về sản phẩm v&amp;agrave; chương tr&amp;igrave;nh ra mắt sản ph&amp;acirc;̉m mới của&amp;nbsp;EbookS. Nhờ nền tảng đ&amp;oacute;, việc mua b&amp;aacute;n tr&amp;ecirc;n&amp;nbsp;EbookS&amp;nbsp;trở n&amp;ecirc;n nhanh ch&amp;oacute;ng v&amp;agrave; đơn giản hơn. Bạn c&amp;oacute; thể li&amp;ecirc;n h&amp;ecirc;̣ trực tiếp với nh&amp;agrave; b&amp;aacute;n h&amp;agrave;ng để hỏi trực tiếp về cu&amp;ocirc;́n sách cần mua.&lt;/p&gt;&lt;p&gt;Đến với&amp;nbsp;EbookS, cơ hội để mua những cu&amp;ocirc;́n sách hay và đ&amp;ocirc;̣c đáo trở n&amp;ecirc;n dễ d&amp;agrave;ng hơn bao giờ hết. Chỉ với v&amp;agrave;i thao t&amp;aacute;c tr&amp;ecirc;n ứng dụng, bạn đ&amp;atilde; c&amp;oacute; thể đặt mua những sản phẩm của m&amp;igrave;nh. Kh&amp;ocirc;ng những thế, bạn còn có th&amp;ecirc;̉ xem những th&amp;ocirc;ng tin c&amp;acirc;̀n thi&amp;ecirc;́t v&amp;ecirc;̀ sản ph&amp;acirc;̉m đ&amp;ecirc;̉ có th&amp;ecirc;m nhi&amp;ecirc;̀u sự lựa chọn cho bản th&amp;acirc;n. Khi đăng nhập tại&amp;nbsp;EbookS, bạn c&amp;oacute; thể dễ d&amp;agrave;ng chọn các loại sản phẩm, theo d&amp;otilde;i đơn h&amp;agrave;ng, thanh toán sản ph&amp;acirc;̉m nhanh chóng, li&amp;ecirc;n h&amp;ecirc;̣ trực ti&amp;ecirc;́p với cửa hàng.&lt;/p&gt;&lt;h2&gt;&lt;strong&gt;MUA H&amp;Agrave;NG CH&amp;Iacute;NH H&amp;Atilde;NG TỪ C&amp;Aacute;C HÃNG LỚN VỚI&amp;nbsp;&lt;/strong&gt;&lt;strong&gt;EBOOKS&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;Mua sách tr&amp;ecirc;n&amp;nbsp;EbookS&amp;nbsp;lu&amp;ocirc;n l&amp;agrave; một trải nghiệm ấn tượng. D&amp;ugrave; bạn đang c&amp;oacute; nhu cầu mua bất kỳ cu&amp;ocirc;́n sách nào th&amp;igrave;&amp;nbsp;EbookS&amp;nbsp;cũng sẽ đảm bảo cung cấp cho bạn những cu&amp;ocirc;́n sách ưng &amp;yacute;. L&amp;agrave; một cửa hàng sách trực tuy&amp;ecirc;́n uy t&amp;iacute;n,&amp;nbsp;EbookS&amp;nbsp;lu&amp;ocirc;n cam kết mang lại cho kh&amp;aacute;ch h&amp;agrave;ng những trải nghiệm mua sắm online gi&amp;aacute; rẻ, an to&amp;agrave;n v&amp;agrave; tin cậy. Mọi th&amp;ocirc;ng tin về người b&amp;aacute;n v&amp;agrave; người mua đều được bảo mật tuyệt đối. C&amp;aacute;c hoạt động giao dịch thanh to&amp;aacute;n tại&amp;nbsp;EbookS&amp;nbsp;lu&amp;ocirc;n được đảm bảo diễn ra nhanh ch&amp;oacute;ng, an to&amp;agrave;n.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;TRUY C&amp;Acirc;̣P EBOOKS&amp;nbsp;NGAY ĐỂ MUA SÁCH ONLINE MỌI L&amp;Uacute;C, MỌI NƠI&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Ưu điểm của ứng dụng EbookS l&amp;agrave; cho ph&amp;eacute;p bạn mua sách mọi l&amp;uacute;c, mọi nơi. Bạn c&amp;oacute; thể truy c&amp;acirc;̣p vào EbookS đ&amp;ecirc;̉ có th&amp;ecirc;̉ lựa chọn những cu&amp;ocirc;́n sách một c&amp;aacute;ch nhanh ch&amp;oacute;ng v&amp;agrave; tiện lợi. Ngo&amp;agrave;i ra, ứng dụng EbookS c&amp;ograve;n c&amp;oacute; những ưu điểm sau: - Giao diện th&amp;acirc;n thiện, đơn giản, dễ sử dụng. Bạn sẽ dễ d&amp;agrave;ng thấy được ngay những sản phẩm nổi bật cũng như dễ d&amp;agrave;ng t&amp;igrave;m đến c&amp;aacute;c &amp;ocirc; t&amp;igrave;m kiếm, giỏ h&amp;agrave;ng. Ứng dụng t&amp;iacute;ch hợp c&amp;ocirc;ng nghệ quản l&amp;yacute; giỏ hàng tiện lợi tr&amp;ecirc;n c&amp;ugrave;ng một t&amp;agrave;i khoản. Bạn sẽ l&amp;agrave; người mua h&amp;agrave;ng rất linh hoạt, dễ d&amp;agrave;ng.&lt;/p&gt;&lt;p&gt;H&amp;atilde;y truy cập website EbookS để gia tăng th&amp;ecirc;m nhiều trải nghiệm độc đ&amp;aacute;o cho h&amp;agrave;nh tr&amp;igrave;nh mua sắm trải nghi&amp;ecirc;̣m những ki&amp;ecirc;́n thức tuyệt vời v&amp;agrave; si&amp;ecirc;u tiết kiệm ngay h&amp;ocirc;m nay.&lt;/p&gt;');

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
(2, 'tam', 'tam', 'e10adc3949ba59abbe56e057f20f883e', 2),
(3, 'khanh', 'khanh', 'e10adc3949ba59abbe56e057f20f883e', 1),
(4, 'Hoàng Bảo Phúc', 'Hoàng Bảo Phúc', 'e10adc3949ba59abbe56e057f20f883e', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_ids` (`category_ids`(768));

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`,`customer_id`),
  ADD KEY `customer_id` (`customer_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`,`book_id`),
  ADD KEY `book_id` (`book_id`);

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
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
