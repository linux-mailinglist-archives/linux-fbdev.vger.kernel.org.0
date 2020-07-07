Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 162A1217836
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2020 21:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbgGGTr2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 7 Jul 2020 15:47:28 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:37380 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbgGGTr1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 7 Jul 2020 15:47:27 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 067JkxIM124596;
        Tue, 7 Jul 2020 19:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=7ka99ntbZuf+A8IlvSt2KS3LGKt89mxwM+1Jr2hH0MA=;
 b=bW4ysUsYZMqYkYC3xxxu7KQ9AzO17HPJbulqZUqniD4y1nDyf5V3H2JZ/fPmgYLqi/Ne
 IC/5pjNzuCuyM7hh9tSlU9AWl8L58NEF1ioKDm6aqUg620Ic8Mp0jmghZBoik0S0ESdK
 Tz3HzOiSIFe4hfeoolKLQVnnhw5gcKVbiCrGbMkCdtkw81IB/i56XaVs4Qbx4/S9bq6f
 uTUVSgj6qo+hCw7lv27DbOlVl1lgX6ATEfKLrLAMVkfIr+LPigTCsPjqyl+4Hj4Top3r
 IrK549/WiscxvaNAKij/y4nMfeG+/qyoq04gc/VAyz2JuCYoGlbNYIKpMbX3bM8IasSG +w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 322kv6eenb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 07 Jul 2020 19:47:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 067JcJ4c160071;
        Tue, 7 Jul 2020 19:47:22 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 3233pxq21d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Jul 2020 19:47:22 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 067JlKXe011445;
        Tue, 7 Jul 2020 19:47:21 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Jul 2020 12:47:20 -0700
Date:   Tue, 7 Jul 2020 22:47:14 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     George Kennedy <george.kennedy@oracle.com>
Cc:     b.zolnierkie@samsung.com, linux-fbdev@vger.kernel.org,
        dhaval.giani@oracle.com
Subject: Re: [PATCH 1/1] fbmem: add margin check to fb_check_caps()
Message-ID: <20200707194714.GA2571@kadam>
References: <1594149963-13801-1-git-send-email-george.kennedy@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594149963-13801-1-git-send-email-george.kennedy@oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9675 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007070132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9675 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 mlxscore=0 adultscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007070133
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Jul 07, 2020 at 03:26:03PM -0400, George Kennedy wrote:
> A fb_ioctl() FBIOPUT_VSCREENINFO call with invalid xres setting
> or yres setting in struct fb_var_screeninfo will result in a
> KASAN: vmalloc-out-of-bounds failure in bitfill_aligned() as
> the margins are being cleared. The margins are cleared in
> chunks and if the xres setting or yres setting is a value of
> zero upto the chunk size, the failure will occur.
> 
> Add a margin check to validate xres and yres settings.
> 
> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>

Suggested-by is perhaps a bit strong.  Let's change that to:

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

